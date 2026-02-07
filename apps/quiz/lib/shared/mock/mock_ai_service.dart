import 'package:ai/ai/dto/ai_request.dart';
import 'package:ai/ai/dto/ai_response.dart';
import 'package:ai/ai/dto/openai_response.dart';
import 'package:ai/ai/i_ai_service.dart';

/// Mock configurable para `IAiService`.
///
/// Permite devolver una respuesta fija, lanzar una excepción o delegar
/// la lógica a un handler asíncrono proporcionado en tests.
class MockAiService<TRes extends AIResponse> implements IAiService<TRes> {
  final Future<TRes> Function(AIRequest request)? _handler;
  TRes? _fixedResponse;
  Object? _exception;

  MockAiService({
    TRes? response,
    Object? exception,
    Future<TRes> Function(AIRequest)? handler,
  }) : _fixedResponse = response,
       _exception = exception,
       _handler = handler;

  /// Establece la respuesta fija que devolverá el mock.
  void setResponse(TRes response) => _fixedResponse = response;

  /// Establece una excepción que será lanzada al invocar `consume`.
  void setException(Object exception) => _exception = exception;

  /// Establece un handler personalizado para procesar requests.
  MockAiService<TRes> withHandler(Future<TRes> Function(AIRequest) handler) =>
      MockAiService<TRes>(handler: handler);

  @override
  Future<TRes> consume(AIRequest request) async {
    if (_handler != null) return _handler(request);
    if (_exception != null) throw _exception!;
    if (_fixedResponse != null) return _fixedResponse as TRes;

    // Provide a sensible default AI response that matches the parser
    // used in AiServiceAdapter.generateQuestions. The adapter accepts
    // either a direct JSON list or an object with a `questions` array
    // inside the OpenAI message content. We create a JSON with
    // { "questions": [ ... ] } where each question matches the
    // `Question.fromJson` shape.

    const defaultQuestionsJson = '''{
  "questions": [
    {
      "id": "q1",
      "text": "¿Cuál es la capital de Francia?",
      "options": ["París", "Londres", "Berlín", "Madrid"],
      "correctIndex": 0,
      "explanation": "París es la capital de Francia."
    },
    {
      "id": "q2",
      "text": "¿Cuánto es 2+2?",
      "options": ["3", "4", "5", "22"],
      "correctIndex": 1,
      "explanation": "2+2 es 4."
    }
  ]
}''';

    final openAiMsg = OpenAiMessage(
      role: 'assistant',
      content: defaultQuestionsJson,
    );
    final choice = OpenAiChoice(message: openAiMsg);
    final openAiResp = OpenAiResponse(choices: [choice]);
    final aiResp = AIResponse<OpenAiResponse>(data: openAiResp);
    return aiResp as TRes;
  }
}
