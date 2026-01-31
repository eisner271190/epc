import 'quiz_config.dart';

/// Provee parámetros del quiz (topic, language, numQuestions, optionsCount,
/// timePerQuestionSeconds).
abstract class IQuizParametersProvider {
  QuizConfig getParameters();
}
