// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TopicImpl _$$TopicImplFromJson(Map<String, dynamic> json) => _$TopicImpl(
  name: json['name'] as String,
  lastUsed: DateTime.parse(json['lastUsed'] as String),
);

Map<String, dynamic> _$$TopicImplToJson(_$TopicImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lastUsed': instance.lastUsed.toIso8601String(),
    };
