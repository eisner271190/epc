// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Quiz';

  @override
  String get configTitle => 'Configuración del Quiz';

  @override
  String get startButton => 'Empezar';

  @override
  String get settingsButton => 'Configuración';

  @override
  String get historyButton => 'Historial';

  @override
  String get topicLabel => 'Tema';

  @override
  String get previousTopicsLabel => 'Temas Previos';

  @override
  String get numQuestionsLabel => 'Número de preguntas';

  @override
  String get optionsCountLabel => 'Opciones por pregunta';

  @override
  String get languageLabel => 'Idioma';

  @override
  String get timePerQuestionLabel => 'Tiempo por pregunta: ';

  @override
  String get timeLabel => 'Tiempo por pregunta (segundos)';

  @override
  String get unlimitedTime => 'Sin límite';

  @override
  String get enterTopicMessage => 'Ingrese un tema';

  @override
  String get quizTitle => 'Quiz';

  @override
  String get questionLabel => 'Pregunta';

  @override
  String get ofPreposition => 'de';

  @override
  String get timeRemaining => 'Tiempo restante:';

  @override
  String get previousButton => 'Anterior';

  @override
  String get finishButton => 'Finalizar';

  @override
  String get resultsTitle => 'Resultados';

  @override
  String get correctLabel => 'Correctas:';

  @override
  String get incorrectLabel => 'Incorrectas:';

  @override
  String get percentageLabel => 'Porcentaje:';

  @override
  String get explanationsLabel => 'Explicaciones de respuestas incorrectas:';

  @override
  String get saveHistoryButton => 'Guardar en historial';

  @override
  String get repeatQuizButton => 'Repetir quiz';

  @override
  String get backToStartButton => 'Volver al inicio';

  @override
  String get historyTitle => 'Historial de Temas';

  @override
  String get noTopics => 'No hay temas guardados';

  @override
  String get deleteTopic => 'Eliminar';

  @override
  String get backButton => 'Volver';

  @override
  String get recentTopics => 'Temas recientes';

  @override
  String get viewAllTopics => 'Ver todos los temas';

  @override
  String get settingsTitle => 'Configuración';

  @override
  String get themeToggle => 'Cambiar tema';

  @override
  String get drawerHeader => 'Tus temas';

  @override
  String get errorPrefix => 'Error: ';

  @override
  String get spanish => 'Español';

  @override
  String get english => 'English';

  @override
  String get reviewQuizTitle => 'Revisar Quiz';

  @override
  String get reviewPlaceholder => 'Implementado en History/Result screens';

  @override
  String get savedToHistory => 'Guardado en historial';

  @override
  String get noQuestions => 'No hay preguntas';

  @override
  String get mockExplanationPrefix =>
      'Explicación: La respuesta correcta es la opción ';

  @override
  String mockQuestionTemplate(String topic, String idx) {
    return '$topic - Pregunta $idx: Describe brevemente un concepto clave relacionado con $topic.';
  }

  @override
  String mockOptionTemplate(String optIdx, String qIdx) {
    return 'Opción $optIdx para pregunta $qIdx';
  }

  @override
  String get processingAuth => 'Procesando autenticación...';

  @override
  String get pressEnterHint => 'Presiona Enter para iniciar';

  @override
  String get userLabel => 'Usuario';

  @override
  String get userHint => 'Ingresa epc';

  @override
  String get passwordLabel => 'Contraseña';

  @override
  String get passwordHint => 'Ingresa epc';

  @override
  String get pleaseEnterUser => 'Por favor ingresa un usuario';

  @override
  String get pleaseEnterPassword => 'Por favor ingresa una contraseña';

  @override
  String get cancelButton => 'Cancelar';

  @override
  String get viewPlansButton => 'Ver Planes';

  @override
  String get getPremiumLabel => 'Obtener Premium';

  @override
  String get restorePurchasesButton => 'Restaurar compras';

  @override
  String get plansSubscriptionTitle => 'Planes y Suscripción';

  @override
  String get confirmPurchaseTitle => 'Confirmar compra';

  @override
  String get buyButton => 'Comprar';

  @override
  String get premiumPlusComingSoon => 'Premium Plus estará disponible pronto';

  @override
  String get mockEmailInfo => 'Email: test@example.com';

  @override
  String get mockPasswordInfo => 'Password: any non-empty value';

  @override
  String get loginButton => 'Iniciar Sesión';

  @override
  String get welcomeToPremium => '¡Bienvenido a Premium! 🎉';

  @override
  String get changeLanguage => 'Cambiar idioma';

  @override
  String get languageChanged => 'Idioma cambiado';

  @override
  String get limitReached => '¡Límite alcanzado!';

  @override
  String get limitReachedMessage =>
      'Has usado todos tus quizzes gratuitos este mes.\n\nActualiza a Premium para obtener quizzes ilimitados sin publicidad.';

  @override
  String get getPremium => 'Obtener Premium';

  @override
  String get confirmPurchaseMonthly =>
      '¿Deseas suscribirte al plan Premium Mensual por \$4.99?';

  @override
  String get confirmPurchaseAnnual =>
      '¿Deseas suscribirte al plan Premium Anual por \$39.99?';
}
