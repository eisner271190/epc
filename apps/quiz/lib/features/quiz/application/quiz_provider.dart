import 'package:flutter/material.dart';
import 'package:quiz_generator/features/quiz/application/env_quiz_parameters_provider.dart';
import 'package:quiz_generator/features/quiz/application/i_quiz_parameters_provider.dart';
import 'package:quiz_generator/features/quiz/application/quiz_dependencies.dart';
import 'package:quiz_generator/features/quiz/application/quiz_orchestrator.dart';
import 'package:quiz_generator/features/quiz/application/quiz_config.dart';
import 'package:quiz_generator/features/quiz/data/ai_service_adapter.dart';
import 'package:quiz_generator/features/quiz/domain/question.dart';
import 'package:quiz_generator/features/quiz/domain/quiz_generation_config.dart';
import 'package:quiz_generator/features/history/application/history_provider.dart';
import 'package:core/core/log/logger.dart';
import 'quiz_timer.dart';
import 'quiz_result_calculator.dart';
import 'quiz_state_coordinator.dart';
import 'quiz_history_coordinator.dart';

/// Provider de estado del quiz
/// Responsabilidad: Coordinar estado del quiz actual
class QuizProvider extends ChangeNotifier {
  final AiServiceAdapter adapter;
  final QuizConfig config;
  final QuizTimer timer;
  final QuizStateCoordinator _state;
  final QuizHistoryCoordinator _history;
  final IQuizParametersProvider parametersProvider;

  bool isLoading = false;
  QuizGenerationConfig genConfig = QuizGenerationConfig.empty();

  QuizProvider({QuizDependencies? deps})
    : adapter = deps?.adapter ?? AiServiceAdapter(),
      config = deps?.config ?? QuizConfig(),
      timer = deps?.timer ?? QuizTimer(),
      _state = deps?.state ?? QuizStateCoordinator(),
      _history = deps?.history ?? QuizHistoryCoordinator(),
      parametersProvider =
          deps?.parametersProvider ?? EnvQuizParametersProvider();

  /// Delegación a state
  List<Question> get questions => _state.questions;
  set topic(String value) => config.setTopic(value);
  int get numQuestions => config.numQuestions;
  set numQuestions(int v) => config.setNumQuestions(v);

  int get optionsCount => config.optionsCount;
  set optionsCount(int v) => config.setOptionsCount(v);

  String get language => config.language;
  set language(String v) => config.setLanguage(v);

  int? get timePerQuestionSeconds => config.timePerQuestionSeconds;
  set timePerQuestionSeconds(int? v) => config.setTimePerQuestion(v);
  int get currentIndex => _state.currentIndex;

  int get remainingSeconds => timer.remainingSeconds;

  Future<void> startQuiz() async {
    _logStartQuiz();
    isLoading = true;
    notifyListeners();

    final orchestrator = QuizOrchestrator(
      adapter: adapter,
      timer: timer,
      state: _state,
      parametersProvider: parametersProvider,
    );

    genConfig = await orchestrator.start(config, nextQuestion);

    isLoading = false;

    _logQuizStarted();
    notifyListeners();
  }

  void _logStartQuiz() {
    Logger.info('[PROVIDER] Starting quiz');
  }

  void _logQuizStarted() {
    Logger.info('[PROVIDER] Quiz started', data: {'count': questions.length});
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
