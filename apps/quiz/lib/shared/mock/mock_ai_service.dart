import 'package:ai/ai/dto/ai_request.dart';
import 'package:ai/ai/dto/ai_response.dart';
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

    throw UnimplementedError(
      'MockAiService: no se configuró respuesta ni handler',
    );
  }
}
