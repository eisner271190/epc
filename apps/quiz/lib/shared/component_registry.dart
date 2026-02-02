import 'package:ai/ai/i_ai_service.dart';
import 'package:ai/ai/ai_service.dart';
import 'package:core/profile/component_provider.dart';
import 'package:quiz_generator/features/auth/data/auth_service.dart';
import 'package:quiz_generator/shared/mock/mock_ai_service.dart';
import 'package:quiz_generator/shared/mock/mock_auth_service.dart';
import 'package:quiz_generator/features/auth/domain/i_auth_service.dart';

class ComponentRegistry {
  ComponentRegistry._();

  static final Map<Type, dynamic> _typed = {};

  /// Build mantiene compatibilidad con el mapa por `String`.
  static Map<String, dynamic> build() {
    final components = <String, dynamic>{};

    final auth = ComponentProvider.resolve<IAuthService>(
      envKey: 'AUTH_SERVICE_MODE',
      mock: MockAuthService(),
      real: AuthService(),
    );
    components['auth'] = auth;
    _typed[IAuthService] = auth;

    final ai = ComponentProvider.resolve<IAiService>(
      envKey: 'AI_SERVICE_MODE',
      mock: MockAiService(),
      real: AiService(),
    );
    components['ai'] = ai;
    _typed[IAiService] = ai;

    return components;
  }

  /// Acceso tipado por interfaz: `final auth = ComponentRegistry.get<IAuthService>();`
  static T get<T>() => _typed[T] as T;
}
