import '../domain/i_auth_service.dart';
import 'auth_service.dart';
import '../../../shared/mock/mock_auth_service.dart';
import '../../../core/app_config.dart';

/// Factory para crear instancias de IAuthService según el perfil configurado.
/// Sigue el principio de Factory Pattern y Dependency Inversion (SOLID).
class AuthServiceFactory {
  /// Crea una instancia de IAuthService según el valor de PROFILE en .env
  ///
  /// MOCK mode -> MockAuthService (útil para desarrollo sin Cognito)
  /// DEV mode -> AuthService (implementación real)
  static IAuthService create() {
    if (AppConfig.isMockMode) {
      return MockAuthService();
    } else {
      return AuthService();
    }
  }
}
