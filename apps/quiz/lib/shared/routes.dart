/// Rutas de navegación de la aplicación
/// Responsabilidad: Centralizar todas las rutas de la app
abstract final class AppRoutes {
  AppRoutes._();

  /// Pantalla de quiz en progreso
  static const String quiz = '/quiz';

  /// Pantalla de resultados del quiz
  static const String result = '/result';

  /// Pantalla de configuración
  static const String settings = '/settings';

  /// Pantalla de historial de quizzes
  static const String history = '/history';

  /// Pantalla de suscripciones/planes premium
  static const String subscription = '/subscription';

  /// Pantalla de login/autenticación
  static const String login = '/login';
}
