import 'package:quiz_generator/features/quiz/domain/quiz_generation_config.dart';

/// Provee parámetros del quiz (topic, language, numQuestions, optionsCount,
/// timePerQuestionSeconds).
abstract class IQuizParametersProvider {
  QuizGenerationConfig getParameters();
}
