import 'package:core/core/env/env_var_descriptor.dart';
import 'package:core/core/env/i_env.dart';
import 'package:core/core/helper/env_helper.dart';

class QuizEnv implements IEnv {
  QuizEnv();

  // Keys
  static const String keyBackendHost = 'QUIZ_BACKEND_HOST';
  static const String keyApiKey = 'QUIZ_API_KEY';

  // Getters
  static String get backendHost => EnvHelper.getEnv(keyBackendHost);
  static String get apiKey => EnvHelper.getEnv(keyApiKey);

  @override
  List<EnvVarDescriptor> buildListEnvs() {
    return [
      EnvVarDescriptor(name: keyBackendHost, isRequired: true),
      EnvVarDescriptor(name: keyApiKey, isRequired: false),
    ];
  }
}
