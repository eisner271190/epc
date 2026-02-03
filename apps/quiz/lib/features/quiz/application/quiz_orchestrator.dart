import 'package:quiz_generator/features/quiz/data/ai_service_adapter.dart';
import 'package:quiz_generator/features/quiz/application/quiz_config.dart';
import 'package:quiz_generator/features/quiz/application/i_quiz_parameters_provider.dart';
import 'package:quiz_generator/features/quiz/domain/quiz_generation_config.dart';
import 'package:quiz_generator/features/quiz/domain/question.dart';
import 'quiz_timer.dart';
import 'quiz_state_coordinator.dart';

/// Orquesta la generación de preguntas y el inicio del quiz.
class QuizOrchestrator {
  final AiServiceAdapter adapter;
  final QuizTimer timer;
  final QuizStateCoordinator state;
  final IQuizParametersProvider parametersProvider;

  QuizOrchestrator({
    required this.adapter,
    required this.timer,
    required this.state,
    required this.parametersProvider,
  });

  /// Ejecuta la generación y arranca el temporizador. Devuelve la configuración usada.
  Future<QuizGenerationConfig> start(
    QuizConfig config,
    void Function() onNextQuestion,
  ) async {
    final genConfig = parametersProvider.getParameters().withTopic(
      config.topic,
    );
    final List<Question> generated = await adapter.generateQuestions(genConfig);
    state.setQuestions(generated);
    timer.start(genConfig.timePerQuestionSeconds, onNextQuestion);
    return genConfig;
  }
}
