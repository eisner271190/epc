import 'package:quiz_generator/features/quiz/domain/quiz_generation_config.dart';

import 'i_quiz_parameters_provider.dart';
import '../config/quiz_env.dart';

/// Implementación que obtiene parámetros desde variables de entorno via
/// `QuizEnv`.
class EnvQuizParametersProvider implements IQuizParametersProvider {
  @override
  QuizGenerationConfig getParameters() {
    final language = QuizEnv.language;
    final numQuestions = QuizEnv.numQuestions;
    final optionsCount = QuizEnv.optionsCount;
    final timePerQuestion = QuizEnv.timePerQuestion.inSeconds;

    return QuizGenerationConfig(
      topic: '',
      language: language,
      numQuestions: numQuestions,
      optionsCount: optionsCount,
      timePerQuestionSeconds: timePerQuestion,
    );
  }
}
