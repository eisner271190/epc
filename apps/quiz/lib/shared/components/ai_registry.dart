import 'package:ai/ai/dto/ai_response.dart';
import 'package:ai/ai/dto/openai_response.dart';
import 'package:ai/ai/i_ai_service.dart';
import 'package:ai/ai/ai_service.dart';
import 'package:quiz_generator/shared/mock/mock_ai_service.dart';
import 'package:core/profile/component_parameter.dart';
import '../component_registry.dart';

class AiRegistry {
  static void create() {
    final param = ComponentParameter<IAiService<AIResponse<OpenAiResponse>>>(
      envKey: 'AI_SERVICE_MODE',
      interfaceType: IAiService<AIResponse<OpenAiResponse>>,
      mock: MockAiService<AIResponse<OpenAiResponse>>(),
      real: AiService<AIResponse<OpenAiResponse>>(),
    );
    ComponentRegistry.registry(param);
  }
}
