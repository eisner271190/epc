import 'package:core/core/helper/env_helper.dart';

/// Configuración central de la aplicación.
/// Encapsula el acceso a variables de entorno siguiendo SOLID.
/// Single Responsibility: Gestionar configuración de la app.
///
/// LINEAMIENTO: Para obtener valores de variables de entorno usar SOLO
/// EnvHelper.getEnv() - NO usar getOptional() ni getRequired().
abstract final class AppConfig {
  AppConfig._();

  // Perfiles de ejecución
  static const String mockProfile = 'MOCK';
  static const String devProfile = 'DEV';

  // Estilos de tema
  static const String chatGptTheme = 'CHATGPT';
  static const String md3Theme = 'MD3';

  /// Obtener el perfil actual (MOCK o DEV)
  static String get profile {
    try {
      return EnvHelper.getEnv('PROFILE').toUpperCase();
    } catch (e) {
      return devProfile;
    }
  }

  /// Verificar si está en modo MOCK
  static bool get isMockMode => profile == mockProfile;

  /// Verificar si está en modo DEV
  static bool get isDevMode => profile == devProfile;

  /// Obtener el estilo de tema actual (CHATGPT o MD3)
  static String get themeStyle {
    try {
      return EnvHelper.getEnv('THEME_STYLE').toUpperCase();
    } catch (e) {
      return chatGptTheme;
    }
  }

  /// Verificar si usa Material Design 3
  static bool get isMd3Theme => themeStyle == md3Theme;

  /// Verificar si usa ChatGPT theme
  static bool get isChatGptTheme => themeStyle == chatGptTheme;

  /// Validar configuración en inicio de app
  static void validate() {
    // Validar que el perfil sea válido
    if (profile != mockProfile && profile != devProfile) {
      throw Exception(
        'Invalid PROFILE: $profile. Must be $mockProfile or $devProfile',
      );
    }
    // Validar que el tema sea válido
    if (themeStyle != chatGptTheme && themeStyle != md3Theme) {
      throw Exception(
        'Invalid THEME_STYLE: $themeStyle. Must be $chatGptTheme or $md3Theme',
      );
    }
  }
}
