/// Resultado de intento de login
/// Responsabilidad: Encapsular resultado de autenticación
class LoginResult {
  final bool success;
  final String? error;

  LoginResult({required this.success, this.error});
}
