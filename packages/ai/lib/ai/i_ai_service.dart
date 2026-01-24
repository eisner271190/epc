import 'dto/ai_request.dart';
import 'dto/ai_response.dart';

abstract class IAiService<TRes extends AIResponse> {
  Future<TRes> consume(AIRequest request);
}
