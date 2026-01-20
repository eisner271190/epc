/// Constantes para configuración general de entorno
/// que no pertenecen a una feature específica
abstract final class SharedEnv {
  SharedEnv._();

  /// Clave para el estilo de tema en .env
  static const String keyThemeStyle = 'THEME_STYLE';

  /// Valor por defecto para el tema
  static const String defaultThemeStyle = 'md3_light';
}
