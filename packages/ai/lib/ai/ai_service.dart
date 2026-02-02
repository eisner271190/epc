import 'dart:async';
import 'dart:convert';
import 'dto/openai_payload.dart';
import 'dto/openai_message.dart';
import 'package:core/core/log/logger.dart';
import 'package:core/core/consume/i_http_client.dart';
import 'package:core/core/consume/http_client_impl.dart';
import 'dto/ai_request.dart';
import 'dto/ai_response.dart';
import 'i_ai_service.dart';
import 'config/ai_env.dart';

class AiService<TRes extends AIResponse> implements IAiService<TRes> {
  final IHttpClient _httpClient = HttpClientImpl();

  static const double _defaultTemperature = 0.7;
  static const int _defaultMaxTokens = 1000;
  static const int _apiTimeoutSeconds = 30;

  Future<TRes> consume(AIRequest request) async {
    final headers = _buildHeaders(AiEnv.apiKey);
    final body = _buildPayload(request).toJson();
    return await handleCallApi(AiEnv.apiUrl, headers: headers, body: body);
  }

  Map<String, String> _buildHeaders(String apiKey) {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };
  }

  OpenAiPayload _buildPayload(AIRequest request) {
    return OpenAiPayload(
      model: AiEnv.model,
      messages: [OpenAiMessage(role: 'user', content: request.prompt)],
      temperature: _defaultTemperature,
      maxTokens: _defaultMaxTokens,
    );
  }

  Future<TRes> handleCallApi(
    String url, {
    required Map<String, String> headers,
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await callApi(url, headers: headers, body: body);
      return handleResponse(response);
    } on TimeoutException catch (e) {
      Logger.error('[AI] Timeout', error: e);
      rethrow;
    } catch (e) {
      Logger.error('[AI] Unexpected error', error: e);
      rethrow;
    }
  }

  Future<HttpResponse> callApi(
    String url, {
    required Map<String, String> headers,
    required Map<String, dynamic> body,
  }) {
    return _httpClient
        .post(url, headers: headers, body: body)
        .timeout(Duration(seconds: _apiTimeoutSeconds));
  }

  Never handleError(HttpResponse response) {
    Logger.error(
      '[AI] API error',
      data: {'statusCode': response.statusCode, 'body': response.body},
    );
    throw Exception('AI API error: ${response.statusCode}');
  }

  TRes handleSuccess(HttpResponse response) {
    return parseResponseFromBody(response.body);
  }

  TRes parseResponseFromBody(String body) {
    final decoded = json.decode(body);
    final resp = AIResponse<dynamic>(data: decoded, meta: null);
    return resp as TRes;
  }

  TRes handleResponse(HttpResponse response) {
    if (response.statusCode == 200) {
      return handleSuccess(response);
    }
    handleError(response);
  }
}
