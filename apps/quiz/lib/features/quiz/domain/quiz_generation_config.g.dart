// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_generation_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizGenerationConfigImpl _$$QuizGenerationConfigImplFromJson(
  Map<String, dynamic> json,
) => _$QuizGenerationConfigImpl(
  topic: json['topic'] as String,
  language: json['language'] as String,
  numQuestions: (json['numQuestions'] as num).toInt(),
  optionsCount: (json['optionsCount'] as num).toInt(),
  timePerQuestionSeconds: (json['timePerQuestionSeconds'] as num?)?.toInt(),
);

Map<String, dynamic> _$$QuizGenerationConfigImplToJson(
  _$QuizGenerationConfigImpl instance,
) => <String, dynamic>{
  'topic': instance.topic,
  'language': instance.language,
  'numQuestions': instance.numQuestions,
  'optionsCount': instance.optionsCount,
  'timePerQuestionSeconds': instance.timePerQuestionSeconds,
};
