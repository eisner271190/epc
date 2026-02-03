abstract final class AppEnv {
  AppEnv._();

  static const String keyGlobalMode = 'SERVICE_MODE';
  static const String keyThemeStyle = 'THEME_STYLE';

  static const List<String> allKeys = [keyGlobalMode, keyThemeStyle];
}
