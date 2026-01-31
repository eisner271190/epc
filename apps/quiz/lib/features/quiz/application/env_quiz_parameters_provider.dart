import 'quiz_config.dart';
import 'i_quiz_parameters_provider.dart';
import '../config/quiz_env.dart';

/// Implementación que obtiene parámetros desde variables de entorno via
/// `QuizEnv`.
class EnvQuizParametersProvider implements IQuizParametersProvider {
  @override
  QuizConfig getParameters() {
    final topic = QuizEnv.topic;
    final language = QuizEnv.language;
    final numQuestions = QuizEnv.numQuestions;
    final optionsCount = QuizEnv.optionsCount;
    final timePerQuestion = QuizEnv.timePerQuestion.inSeconds;

    return QuizConfig(
      topic: topic,
      language: language,
      numQuestions: numQuestions,
      optionsCount: optionsCount,
      timePerQuestionSeconds: timePerQuestion,
    );
  }
}
