import 'package:quiz_generator/shared/log/logger.dart';
import 'package:quiz_generator/features/quiz/domain/question.dart';
import 'package:quiz_generator/features/quiz/domain/ai_strategy.dart';
import 'package:quiz_generator/features/quiz/domain/quiz_generation_config.dart';
import 'strategy_factory.dart';

class AIService {
  static AIStrategy? _strategy;

  static AIStrategy get _getStrategy {
    _strategy ??= StrategyFactory.createStrategy();
    return _strategy!;
  }

  static Future<List<Question>> generateQuestions(
    QuizGenerationConfig config,
  ) async {
    Logger.info(
      'AI Generating questions',
      data: {
        'topic': config.topic,
        'language': config.language,
        'numQuestions': config.numQuestions,
        'optionsCount': config.optionsCount,
      },
    );

    try {
      final questions = await _getStrategy.generateQuestions(config);
      Logger.info(
        'AI Questions generated successfully',
        data: {'count': questions.length},
      );
      return questions;
    } catch (e, stackTrace) {
      Logger.error(
        'AI Failed to generate questions',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
