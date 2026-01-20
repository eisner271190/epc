import 'package:quiz_generator/core/service_mode.dart';
import 'package:quiz_generator/core/service_env.dart';
import 'package:core/core/helper/env_helper.dart';
import 'package:core/core/log/logger.dart';
import 'package:quiz_generator/features/quiz/config/ai_config.dart';
import 'package:quiz_generator/features/quiz/domain/ai_strategy.dart';
import 'package:quiz_generator/features/quiz/data/real_ai_strategy.dart';
import 'package:quiz_generator/features/quiz/data/mock_ai_strategy.dart';
import 'package:quiz_generator/features/quiz/data/openai_api_client.dart';
import 'strategy_config.dart';

abstract final class StrategyFactory {
  StrategyFactory._();

  static ServiceMode _getGlobalMode() {
    final value = EnvHelper.getEnv(ServiceEnv.keyGlobalMode);
    return ServiceMode.fromString(value);
  }

  static ServiceMode _getAiMode() {
    final value = EnvHelper.getEnv(ServiceEnv.keyAiMode);
    return ServiceMode.fromString(value);
  }

  static ServiceMode _resolveMode() {
    final globalMode = _getGlobalMode();

    if (globalMode == ServiceMode.none) {
      final individualMode = _getAiMode();
      _logUsingIndividualMode(individualMode.name);
      return individualMode;
    }

    _logUsingGlobalMode(globalMode.name);
    return globalMode;
  }

  static AIStrategy createStrategy() {
    final config = StrategyConfig.load(promptTemplate: AiConfig.prompt);
    final strategy = _determineStrategy(config);
    _logStrategyCreated(strategy.runtimeType.toString());
    return strategy;
  }

  static AIStrategy _determineStrategy(StrategyConfig config) {
    final mode = _resolveMode();

    if (mode == ServiceMode.mock) {
      _logUsingMockStrategy();
      return MockAIStrategy();
    }

    if (mode == ServiceMode.real &&
        config.apiKey != null &&
        config.apiKey!.isNotEmpty) {
      _logUsingRealStrategy();
      return RealAIStrategy(OpenAiApiClient(), config.promptTemplate);
    }

    _logFallbackToMockStrategy();
    return MockAIStrategy();
  }

  static void _logUsingIndividualMode(String modeName) {
    Logger.info(
      '[STRATEGY_FACTORY] Using individual AI mode',
      data: {'mode': modeName},
    );
  }

  static void _logUsingGlobalMode(String modeName) {
    Logger.info(
      '[STRATEGY_FACTORY] Using global mode for AI',
      data: {'mode': modeName},
    );
  }

  static void _logStrategyCreated(String type) {
    Logger.info('FACTORY AI Strategy created', data: {'type': type});
  }

  static void _logUsingMockStrategy() {
    Logger.info('FACTORY Using MockAIStrategy (mock mode)');
  }

  static void _logUsingRealStrategy() {
    Logger.info('FACTORY Using RealAIStrategy (real mode with API key)');
  }

  static void _logFallbackToMockStrategy() {
    Logger.info('FACTORY Fallback to MockAIStrategy (no valid config)');
  }
}
