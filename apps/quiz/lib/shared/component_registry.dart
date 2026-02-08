import 'package:core/profile/component_provider.dart';
import 'package:core/profile/component_parameter.dart';
import 'package:core/core/log/logger.dart';

class ComponentRegistry {
  ComponentRegistry._();
  static final Map<String, ComponentParameter<dynamic>> _params = {};
  static final Map<String, dynamic> _typed = {};

  static T get<T>() {
    final hashKey = ComponentParameter.getHash(T);

    Logger.info(
      '[COMPONENT_REGISTRY] get requested',
      data: {'hashKey': hashKey},
    );

    if (_typed.containsKey(hashKey)) {
      return _typed[hashKey] as T;
    }

    throw StateError('Component not found for type $hashKey');
  }

  static void registry(ComponentParameter param) {
    Logger.info(
      '[COMPONENT_REGISTRY] Register component',
      data: {'envKey': param.envKey},
    );
    _params[param.hashKey] = param;
    Logger.info(
      '[COMPONENT_REGISTRY] Registered component',
      data: {'hashKey': param.hashKey},
    );
  }

  static T getComponent<T>(String hashKey) {
    Logger.info(
      '[COMPONENT_REGISTRY] Resolving component',
      data: {'hashKey': hashKey},
    );
    final param = _params[hashKey] as ComponentParameter<T>;
    try {
      final instance = ComponentProvider.resolve<T>(param);
      Logger.info(
        '[COMPONENT_REGISTRY] Resolved component',
        data: {'hashKey': hashKey},
      );
      return instance;
    } catch (e, st) {
      Logger.error(
        '[COMPONENT_REGISTRY] Error resolving component',
        data: {'hashKey': hashKey},
        error: e,
        stackTrace: st as StackTrace,
      );
      rethrow;
    }
  }

  static void registryAll() {
    Logger.info(
      '[COMPONENT_REGISTRY] Registry all start',
      data: {'count': _params.length},
    );
    for (final hashKey in _params.keys) {
      try {
        final component = getComponent(hashKey);
        add(component, hashKey);
      } catch (e, st) {
        Logger.error(
          '[COMPONENT_REGISTRY] Error registryAll for component',
          data: {'hashKey': hashKey},
          error: e,
          stackTrace: st as StackTrace,
        );
      }
    }
    Logger.info('[COMPONENT_REGISTRY] Registry all finished');
  }

  static void add<T>(T instance, String hashKey) {
    Logger.info(
      '[COMPONENT_REGISTRY] Adding instance',
      data: {'hashKey': hashKey},
    );
    _typed[hashKey] = instance;
    Logger.info(
      '[COMPONENT_REGISTRY] Added instance',
      data: {'hashKey': hashKey},
    );
  }
}
