import 'package:core/core/env/env_var_descriptor.dart';
import 'package:core/core/env/i_env.dart';
import 'package:core/core/helper/env_helper.dart';

class AiEnv implements IEnv {
  AiEnv();

  // Keys
  static const String keyApiKey = 'AI_API_KEY';
  static const String keyApiUrl = 'AI_API_URL';
  static const String keyModel = 'AI_MODEL';
  static const String keyServiceMode = 'AI_SERVICE_MODE';
  static const String keyPrompt = 'AI_PROMPT';

  // Getters
  static String get apiKey => EnvHelper.getEnv(keyApiKey);
  static String get apiUrl => EnvHelper.getEnv(keyApiUrl);
  static String get model => EnvHelper.getEnv(keyModel);
  static String get serviceMode => EnvHelper.getEnv(keyServiceMode);
  static String get prompt => EnvHelper.getEnv(keyPrompt);

  @override
  List<EnvVarDescriptor> buildListEnvs() {
    return [
      EnvVarDescriptor(name: keyApiKey, isRequired: true),
      EnvVarDescriptor(name: keyApiUrl, isRequired: true),
      EnvVarDescriptor(name: keyModel, isRequired: false),
      EnvVarDescriptor(name: keyServiceMode, isRequired: false),
      EnvVarDescriptor(name: keyPrompt, isRequired: true),
    ];
  }
}
