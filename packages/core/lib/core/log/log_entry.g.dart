// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LogEntryImpl _$$LogEntryImplFromJson(Map<String, dynamic> json) =>
    _$LogEntryImpl(
      prefix: json['prefix'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      line: (json['line'] as num?)?.toInt(),
      message: json['message'] as String,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$LogEntryImplToJson(_$LogEntryImpl instance) =>
    <String, dynamic>{
      'prefix': instance.prefix,
      'timestamp': instance.timestamp.toIso8601String(),
      'line': instance.line,
      'message': instance.message,
      'data': instance.data,
    };
