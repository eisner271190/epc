import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_generation_config.freezed.dart';
part 'quiz_generation_config.g.dart';

@freezed
class QuizGenerationConfig with _$QuizGenerationConfig {
  const factory QuizGenerationConfig({
    required String topic,
    required String language,
    required int numQuestions,
    required int optionsCount,
    int? timePerQuestionSeconds,
  }) = _QuizGenerationConfig;

  /// Constructor de conveniencia sin parámetros con valores por defecto.
  factory QuizGenerationConfig.empty() => const QuizGenerationConfig(
    topic: '',
    language: 'Español',
    numQuestions: 5,
    optionsCount: 4,
    timePerQuestionSeconds: null,
  );

  factory QuizGenerationConfig.fromJson(Map<String, dynamic> json) =>
      _$QuizGenerationConfigFromJson(json);
}

// Extensión de conveniencia para 'setear' topic devolviendo una nueva
// instancia (inmutable) usando `copyWith` generado por freezed.
extension QuizGenerationConfigSetTopic on QuizGenerationConfig {
  QuizGenerationConfig withTopic(String topic) => copyWith(topic: topic);
}
