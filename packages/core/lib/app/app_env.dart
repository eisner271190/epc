import 'package:core/core/env/env_var_descriptor.dart';
import 'package:core/core/env/i_env.dart';
import 'package:core/core/helper/env_helper.dart';

class AppEnv implements IEnv {
  AppEnv();

  static const String keyGlobalMode = 'SERVICE_MODE';
  static const String keyThemeStyle = 'THEME_STYLE';

  static const List<String> allKeys = [keyGlobalMode, keyThemeStyle];

  static String get globalMode => getEnv(keyGlobalMode);
  static String get themeStyle => getEnv(keyThemeStyle);

  static String getEnv(String key) => EnvHelper.getEnv(key);

  @override
  List<EnvVarDescriptor> buildListEnvs() {
    return [
      EnvVarDescriptor(name: keyGlobalMode, isRequired: false),
      EnvVarDescriptor(name: keyThemeStyle, isRequired: false),
    ];
  }
}
