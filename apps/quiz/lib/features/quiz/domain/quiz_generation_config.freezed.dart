// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_generation_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

QuizGenerationConfig _$QuizGenerationConfigFromJson(Map<String, dynamic> json) {
  return _QuizGenerationConfig.fromJson(json);
}

/// @nodoc
mixin _$QuizGenerationConfig {
  String get topic => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  int get numQuestions => throw _privateConstructorUsedError;
  int get optionsCount => throw _privateConstructorUsedError;
  int? get timePerQuestionSeconds => throw _privateConstructorUsedError;

  /// Serializes this QuizGenerationConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizGenerationConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizGenerationConfigCopyWith<QuizGenerationConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizGenerationConfigCopyWith<$Res> {
  factory $QuizGenerationConfigCopyWith(
    QuizGenerationConfig value,
    $Res Function(QuizGenerationConfig) then,
  ) = _$QuizGenerationConfigCopyWithImpl<$Res, QuizGenerationConfig>;
  @useResult
  $Res call({
    String topic,
    String language,
    int numQuestions,
    int optionsCount,
    int? timePerQuestionSeconds,
  });
}

/// @nodoc
class _$QuizGenerationConfigCopyWithImpl<
  $Res,
  $Val extends QuizGenerationConfig
>
    implements $QuizGenerationConfigCopyWith<$Res> {
  _$QuizGenerationConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizGenerationConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topic = null,
    Object? language = null,
    Object? numQuestions = null,
    Object? optionsCount = null,
    Object? timePerQuestionSeconds = freezed,
  }) {
    return _then(
      _value.copyWith(
            topic: null == topic
                ? _value.topic
                : topic // ignore: cast_nullable_to_non_nullable
                      as String,
            language: null == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                      as String,
            numQuestions: null == numQuestions
                ? _value.numQuestions
                : numQuestions // ignore: cast_nullable_to_non_nullable
                      as int,
            optionsCount: null == optionsCount
                ? _value.optionsCount
                : optionsCount // ignore: cast_nullable_to_non_nullable
                      as int,
            timePerQuestionSeconds: freezed == timePerQuestionSeconds
                ? _value.timePerQuestionSeconds
                : timePerQuestionSeconds // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QuizGenerationConfigImplCopyWith<$Res>
    implements $QuizGenerationConfigCopyWith<$Res> {
  factory _$$QuizGenerationConfigImplCopyWith(
    _$QuizGenerationConfigImpl value,
    $Res Function(_$QuizGenerationConfigImpl) then,
  ) = __$$QuizGenerationConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String topic,
    String language,
    int numQuestions,
    int optionsCount,
    int? timePerQuestionSeconds,
  });
}

/// @nodoc
class __$$QuizGenerationConfigImplCopyWithImpl<$Res>
    extends _$QuizGenerationConfigCopyWithImpl<$Res, _$QuizGenerationConfigImpl>
    implements _$$QuizGenerationConfigImplCopyWith<$Res> {
  __$$QuizGenerationConfigImplCopyWithImpl(
    _$QuizGenerationConfigImpl _value,
    $Res Function(_$QuizGenerationConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizGenerationConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topic = null,
    Object? language = null,
    Object? numQuestions = null,
    Object? optionsCount = null,
    Object? timePerQuestionSeconds = freezed,
  }) {
    return _then(
      _$QuizGenerationConfigImpl(
        topic: null == topic
            ? _value.topic
            : topic // ignore: cast_nullable_to_non_nullable
                  as String,
        language: null == language
            ? _value.language
            : language // ignore: cast_nullable_to_non_nullable
                  as String,
        numQuestions: null == numQuestions
            ? _value.numQuestions
            : numQuestions // ignore: cast_nullable_to_non_nullable
                  as int,
        optionsCount: null == optionsCount
            ? _value.optionsCount
            : optionsCount // ignore: cast_nullable_to_non_nullable
                  as int,
        timePerQuestionSeconds: freezed == timePerQuestionSeconds
            ? _value.timePerQuestionSeconds
            : timePerQuestionSeconds // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizGenerationConfigImpl implements _QuizGenerationConfig {
  const _$QuizGenerationConfigImpl({
    required this.topic,
    required this.language,
    required this.numQuestions,
    required this.optionsCount,
    this.timePerQuestionSeconds,
  });

  factory _$QuizGenerationConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizGenerationConfigImplFromJson(json);

  @override
  final String topic;
  @override
  final String language;
  @override
  final int numQuestions;
  @override
  final int optionsCount;
  @override
  final int? timePerQuestionSeconds;

  @override
  String toString() {
    return 'QuizGenerationConfig(topic: $topic, language: $language, numQuestions: $numQuestions, optionsCount: $optionsCount, timePerQuestionSeconds: $timePerQuestionSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizGenerationConfigImpl &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.numQuestions, numQuestions) ||
                other.numQuestions == numQuestions) &&
            (identical(other.optionsCount, optionsCount) ||
                other.optionsCount == optionsCount) &&
            (identical(other.timePerQuestionSeconds, timePerQuestionSeconds) ||
                other.timePerQuestionSeconds == timePerQuestionSeconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    topic,
    language,
    numQuestions,
    optionsCount,
    timePerQuestionSeconds,
  );

  /// Create a copy of QuizGenerationConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizGenerationConfigImplCopyWith<_$QuizGenerationConfigImpl>
  get copyWith =>
      __$$QuizGenerationConfigImplCopyWithImpl<_$QuizGenerationConfigImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizGenerationConfigImplToJson(this);
  }
}

abstract class _QuizGenerationConfig implements QuizGenerationConfig {
  const factory _QuizGenerationConfig({
    required final String topic,
    required final String language,
    required final int numQuestions,
    required final int optionsCount,
    final int? timePerQuestionSeconds,
  }) = _$QuizGenerationConfigImpl;

  factory _QuizGenerationConfig.fromJson(Map<String, dynamic> json) =
      _$QuizGenerationConfigImpl.fromJson;

  @override
  String get topic;
  @override
  String get language;
  @override
  int get numQuestions;
  @override
  int get optionsCount;
  @override
  int? get timePerQuestionSeconds;

  /// Create a copy of QuizGenerationConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizGenerationConfigImplCopyWith<_$QuizGenerationConfigImpl>
  get copyWith => throw _privateConstructorUsedError;
}
