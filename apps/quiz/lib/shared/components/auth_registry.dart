import 'package:auth/features/auth/domain/i_auth_service.dart';
import 'package:auth/features/auth/data/auth_service.dart';
import 'package:quiz_generator/shared/mock/mock_auth_service.dart';
import 'package:core/profile/component_parameter.dart';
import '../component_registry.dart';

class AuthRegistry {
  static void create() {
    final param = ComponentParameter<IAuthService>(
      interfaceType: IAuthService,
      envKey: 'AUTH_SERVICE_MODE',
      mock: MockAuthService(),
      real: AuthService(),
    );
    ComponentRegistry.registry(param);
  }
}
