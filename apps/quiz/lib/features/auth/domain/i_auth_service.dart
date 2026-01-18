import 'auth_user.dart';

/// Interface para servicios de autenticación.
/// Sigue el principio de Inversión de Dependencias (SOLID).
abstract class IAuthService {
  /// Stream que emite el estado actual de autenticación del usuario.
  /// Emite null cuando el usuario no está autenticado.
  Stream<AuthUser?> get authStateChanges;

  /// Usuario actualmente autenticado, o null si no hay sesión activa.
  AuthUser? get currentUser;

  /// Inicia el flujo de autenticación con Google via Cognito Hosted UI.
  ///
  /// Returns true si el navegador se abrió exitosamente, false en caso contrario.
  Future<bool> signInWithHostedUI();

  /// Inicia sesión con credenciales (solo para modo MOCK).
  ///
  /// Returns true si el login fue exitoso, false en caso contrario.
  Future<bool> signInWithCredentials(String email, String password);

  /// Maneja el redirect URI después de la autenticación.
  /// Intercambia el código de autorización por tokens.
  ///
  /// [uri] debe ser el deep link recibido (ej: myapp://auth/callback?code=...)
  ///
  /// Throws [Exception] si hay errores en el proceso.
  Future<void> handleRedirect(Uri uri);

  /// Intenta restaurar la sesión del usuario desde el almacenamiento seguro.
  /// Se debe llamar al iniciar la app.
  Future<void> restoreSession();

  /// Cierra la sesión del usuario.
  /// Limpia tokens del almacenamiento local y abre el logout de Cognito.
  Future<void> signOut();

  /// Libera recursos del servicio.
  void dispose();
}
