import '../helper/shared_env.dart';
import '../helper/env_helper.dart';

abstract final class EnvConfig {
  EnvConfig._();

  static String get themeStyle {
    try {
      return EnvHelper.getEnv(SharedEnv.keyThemeStyle);
    } catch (e) {
      return SharedEnv.defaultThemeStyle;
    }
  }
}
