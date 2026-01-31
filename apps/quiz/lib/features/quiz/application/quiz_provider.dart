import 'package:flutter/material.dart';
import 'package:quiz_generator/features/quiz/application/env_quiz_parameters_provider.dart';
import 'package:quiz_generator/features/quiz/application/i_quiz_parameters_provider.dart';
import 'package:quiz_generator/features/quiz/domain/question.dart';
import 'package:quiz_generator/features/quiz/domain/quiz_generation_config.dart';
import 'package:quiz_generator/features/quiz/application/ai_service.dart';
import 'package:quiz_generator/features/history/application/history_provider.dart';
import 'package:core/core/log/logger.dart';
import 'quiz_config.dart';
import 'quiz_timer.dart';
import 'quiz_result_calculator.dart';
import 'quiz_state_coordinator.dart';
import 'quiz_history_coordinator.dart';

/// Provider de estado del quiz
/// Responsabilidad: Coordinar estado del quiz actual
class QuizProvider extends ChangeNotifier {
  final QuizConfig config = QuizConfig();
  final QuizTimer timer = QuizTimer();
  final QuizStateCoordinator _state = QuizStateCoordinator();
  final QuizHistoryCoordinator _history = QuizHistoryCoordinator();
  final IQuizParametersProvider parametersProvider =
      EnvQuizParametersProvider();

  bool isLoading = false;
  QuizGenerationConfig genConfig = QuizGenerationConfig.empty();
  // Delegación a state
  List<Question> get questions => _state.questions;
  int get currentIndex => _state.currentIndex;

  int get remainingSeconds => timer.remainingSeconds;

  Future<void> startQuiz() async {
    Logger.info('[PROVIDER] Starting quiz', data: config.toMap());
    isLoading = true;
    notifyListeners();

    genConfig = parametersProvider.getParameters();

    final generatedQuestions = await AIService.generateQuestions(genConfig);

    _state.setQuestions(generatedQuestions);
    isLoading = false;
    timer.start(genConfig.timePerQuestionSeconds, nextQuestion);
    Logger.info('[PROVIDER] Quiz started', data: {'count': questions.length});
    notifyListeners();
  }

  void selectAnswer(int index) {
    _state.selectAnswer(index);
    notifyListeners();
  }

  void nextQuestion() {
    _state.next();
    timer.reset();
    notifyListeners();
  }

  void previousQuestion() {
    _state.previous();
    timer.reset();
    notifyListeners();
  }

  Map<String, dynamic> results() {
    return QuizResultCalculator.calculate(questions);
  }

  Future<void> saveToHistory(HistoryProvider historyProvider) async {
    await _history.saveToHistory(
      historyProvider: historyProvider,
      topic: genConfig.topic,
      language: genConfig.language,
      questions: questions,
    );
  }

  void clear() {
    _state.reset();
    timer.stop();
    notifyListeners();
  }

  @override
  void dispose() {
    timer.dispose();
    super.dispose();
  }
}
