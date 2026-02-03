import 'package:quiz_generator/features/quiz/application/quiz_config.dart';
import 'package:quiz_generator/features/quiz/data/ai_service_adapter.dart';
import 'package:quiz_generator/features/quiz/application/i_quiz_parameters_provider.dart';
import 'package:quiz_generator/features/quiz/application/env_quiz_parameters_provider.dart';
import 'quiz_timer.dart';
import 'quiz_state_coordinator.dart';
import 'quiz_history_coordinator.dart';

/// Agrupa dependencias del quiz para reducir parámetros de constructor.
class QuizDependencies {
  final AiServiceAdapter adapter;
  final QuizConfig config;
  final QuizTimer timer;
  final QuizStateCoordinator state;
  final QuizHistoryCoordinator history;
  final IQuizParametersProvider parametersProvider;

  QuizDependencies({
    AiServiceAdapter? adapter,
    QuizConfig? config,
    QuizTimer? timer,
    QuizStateCoordinator? state,
    QuizHistoryCoordinator? history,
    IQuizParametersProvider? parametersProvider,
  }) : adapter = adapter ?? AiServiceAdapter(),
       config = config ?? QuizConfig(),
       timer = timer ?? QuizTimer(),
       state = state ?? QuizStateCoordinator(),
       history = history ?? QuizHistoryCoordinator(),
       parametersProvider = parametersProvider ?? EnvQuizParametersProvider();
}
