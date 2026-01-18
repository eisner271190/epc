// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizHistoryImpl _$$QuizHistoryImplFromJson(Map<String, dynamic> json) =>
    _$QuizHistoryImpl(
      id: json['id'] as String,
      topic: json['topic'] as String,
      language: json['language'] as String,
      numQuestions: (json['numQuestions'] as num).toInt(),
      score: (json['score'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      questions: (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QuizHistoryImplToJson(_$QuizHistoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'topic': instance.topic,
      'language': instance.language,
      'numQuestions': instance.numQuestions,
      'score': instance.score,
      'date': instance.date.toIso8601String(),
      'questions': instance.questions,
    };
