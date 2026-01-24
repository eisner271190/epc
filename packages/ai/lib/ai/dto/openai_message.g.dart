// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openai_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OpenAiMessageImpl _$$OpenAiMessageImplFromJson(Map<String, dynamic> json) =>
    _$OpenAiMessageImpl(
      role: json['role'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$$OpenAiMessageImplToJson(_$OpenAiMessageImpl instance) =>
    <String, dynamic>{'role': instance.role, 'content': instance.content};
