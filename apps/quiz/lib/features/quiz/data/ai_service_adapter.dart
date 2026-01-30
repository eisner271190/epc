import 'dart:convert';

import 'package:core/core/log/logger.dart';
import 'package:quiz_generator/features/quiz/domain/question.dart';
import 'package:quiz_generator/features/quiz/domain/quiz_generation_config.dart';
import 'package:quiz_generator/features/quiz/domain/ai_strategy.dart';

import 'package:ai/ai/dto/ai_request.dart';
import 'package:ai/ai/dto/openai_response.dart';
import 'package:ai/ai/dto/ai_response.dart';
import 'package:ai/ai/i_ai_service.dart';

/// Adapter que conecta un `IAiService` del paquete `ai` con la abstracción
/// `AIStrategy` usada por la app `quiz`.
class AiServiceAdapter implements AIStrategy {
  final IAiService<AIResponse<OpenAiResponse>> _aiService;
  final String _promptTemplate;

  AiServiceAdapter(this._aiService, this._promptTemplate);

  @override
  Future<List<Question>> generateQuestions(QuizGenerationConfig config) async {
    _logGeneratingQuestions();

    final prompt = _buildPrompt(config);
    _logPrompt(prompt);

    final aiRequest = AIRequest(prompt: prompt);
    final aiResponse = await _aiService.consume(aiRequest);

    _logApiResponseSuccessful();

    final openAiData = aiResponse.data;
    if (openAiData == null) {
      throw Exception('Empty AI response');
    }

    final body = openAiData.choices;
    _logResponse(body);

    return _parseResponse(body);
  }

  String _buildPrompt(QuizGenerationConfig config) {
    return _promptTemplate
        .replaceAll('{numQuestions}', config.numQuestions.toString())
        .replaceAll('{topic}', config.topic)
        .replaceAll('{language}', config.language)
        .replaceAll('{optionsCount}', config.optionsCount.toString());
  }

  List<Question> _parseResponse(dynamic body) {
    final choices = _extractChoices(body);
    if (choices.isEmpty) {
      throw Exception('No se recibieron opciones de respuesta de la IA');
    }

    final content = _extractContent(choices);
    return _parseQuestionsFromContent(content);
  }

  List<dynamic> _extractChoices(dynamic body) {
    // body can be List<OpenAiChoice> or dynamic JSON
    if (body is List) return body;
    if (body is Map<String, dynamic>) {
      return body['choices'] as List<dynamic>;
    }
    if (body is String) {
      try {
        final decoded = json.decode(body);
        if (decoded is Map<String, dynamic>)
          return decoded['choices'] as List<dynamic>;
      } catch (_) {}
    }
    throw Exception('Invalid AI response body format');
  }

  String _extractContent(List<dynamic> choices) {
    final first = choices[0];
    if (first is OpenAiChoice) {
      return first.message?.content ?? '';
    }
    if (first is Map && first['message'] is Map) {
      return first['message']['content'] as String;
    }
    throw Exception('Invalid choice format');
  }

  List<Question> _parseQuestionsFromContent(String content) {
    final directParse = _tryParseDirectJson(content);
    if (directParse != null) return directParse;

    final subParse = _tryParseJsonSubstring(content);
    if (subParse != null) return subParse;

    throw Exception('Respuesta de IA no contiene preguntas válidas');
  }

  List<Question>? _tryParseDirectJson(String content) {
    try {
      final parsed = json.decode(content);
      if (parsed is List) {
        return parsed
            .map((e) => Question.fromJson(e as Map<String, dynamic>))
            .toList();
      }

      if (parsed is Map && parsed['questions'] is List) {
        final list = parsed['questions'] as List;
        return list
            .map((e) => Question.fromJson(e as Map<String, dynamic>))
            .toList();
      }

      return null;
    } catch (_) {
      return null;
    }
  }

  List<Question>? _tryParseJsonSubstring(String content) {
    final start = content.indexOf('{');
    final end = content.lastIndexOf('}');

    if (start == -1 || end == -1 || end <= start) return null;

    final sub = content.substring(start, end + 1);
    try {
      final parsed = json.decode(sub);
      if (parsed is Map && parsed['questions'] is List) {
        final list = parsed['questions'] as List;
        return list
            .map((e) => Question.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  void _logGeneratingQuestions() {
    Logger.info('[AI] Generating questions via AI service');
  }

  void _logPrompt(String prompt) {
    Logger.logKeyValue('prompt', prompt);
  }

  void _logApiResponseSuccessful() {
    Logger.info('[AI] API response successful');
  }

  void _logResponse(dynamic response) {
    Logger.logKeyValue('response', response.toString());
  }
}
