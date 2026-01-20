import 'package:core/core/helper/env_helper.dart';
import 'package:core/core/env/env_logger.dart';
import 'ai_env.dart';

/// Configuración de autenticación con Cognito.
/// Los valores se leen de assets/.env
abstract final class AiConfig {
  AiConfig._();

  /// Valida que todas las variables críticas estén configuradas
  static void validate() {
    EnvHelper.validate(AiEnv.requiredKeys);
  }

  /// Imprime las variables de entorno de autenticación
  static void logEnvironmentVariables([String? envFile]) {
    EnvLogger.logEnvironmentVariables(AiEnv.allKeys, envFile);
  }

  static String get apiKey => EnvHelper.getEnv(AiEnv.keyApiKey);
  static String get apiUrl => EnvHelper.getEnv(AiEnv.keyApiUrl);
  static String get model => EnvHelper.getEnv(AiEnv.keyModel);
  static String get prompt => EnvHelper.getEnv(AiEnv.keyPrompt);
}
