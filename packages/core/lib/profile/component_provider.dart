import 'package:core/core/helper/env_helper.dart';
import 'package:core/profile/component_factory.dart';
import 'package:core/profile/component_mode.dart';

class ComponentProvider {
  static T resolve<T>({
    required String envKey,
    required T mock,
    required T real,
  }) {
    final envValue = EnvHelper.getEnv(envKey);
    final mode = envValue.toUpperCase() == 'REAL'
        ? ComponentMode.real
        : ComponentMode.mock;
    return ComponentFactory<T>(mock: mock, real: real).resolve(mode);
  }
}
