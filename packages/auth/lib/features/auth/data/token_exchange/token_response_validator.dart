/// Validador de estructura de respuesta del backend
/// Responsabilidad: Validar estructura de respuesta
class TokenResponseValidator {
  /// Extrae y valida los datos de la respuesta
  static Map<String, dynamic> extractAndValidate(Map<String, dynamic> data) {
    final dataWrapper = data['data'] as Map<String, dynamic>?;
    final tokenData = dataWrapper?['data'] as Map<String, dynamic>?;

    if (tokenData == null) {
      throw Exception('Respuesta del backend sin datos: $data');
    }

    return tokenData;
  }

  /// Valida que el idToken no esté vacío
  static void validateIdToken(String? idToken, Map<String, dynamic> data) {
    if (idToken == null || idToken.isEmpty) {
      throw Exception(
        'Backend devolvió idToken nulo. Mensaje: ${data['message']}',
      );
    }
  }

  /// Valida que el accessToken no esté vacío
  static void validateAccessToken(
    String? accessToken,
    Map<String, dynamic> data,
  ) {
    if (accessToken == null || accessToken.isEmpty) {
      throw Exception(
        'Backend devolvió accessToken nulo. Mensaje: ${data['message']}',
      );
    }
  }
}
