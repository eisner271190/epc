// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openai_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OpenAiPayloadImpl _$$OpenAiPayloadImplFromJson(Map<String, dynamic> json) =>
    _$OpenAiPayloadImpl(
      model: json['model'] as String,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => OpenAiMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      temperature: (json['temperature'] as num).toDouble(),
      maxTokens: (json['maxTokens'] as num).toInt(),
    );

Map<String, dynamic> _$$OpenAiPayloadImplToJson(_$OpenAiPayloadImpl instance) =>
    <String, dynamic>{
      'model': instance.model,
      'messages': instance.messages,
      'temperature': instance.temperature,
      'maxTokens': instance.maxTokens,
    };
