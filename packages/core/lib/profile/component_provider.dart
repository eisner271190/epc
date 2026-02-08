import 'package:core/core/helper/env_helper.dart';
import 'package:core/profile/component_factory.dart';
import 'package:core/profile/component_mode.dart';
import 'package:core/profile/component_parameter.dart';

class ComponentProvider {
  static T resolve<T>(ComponentParameter<T> params) {
    final envValue = EnvHelper.getEnv(params.envKey);
    final mode = envValue.toUpperCase() == 'REAL'
        ? ComponentMode.real
        : ComponentMode.mock;
    return ComponentFactory<T>(
      mock: params.mock,
      real: params.real,
    ).resolve(mode);
  }
}
