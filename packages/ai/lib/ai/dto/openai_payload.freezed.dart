// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'openai_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OpenAiPayload _$OpenAiPayloadFromJson(Map<String, dynamic> json) {
  return _OpenAiPayload.fromJson(json);
}

/// @nodoc
mixin _$OpenAiPayload {
  String get model => throw _privateConstructorUsedError;
  List<OpenAiMessage> get messages => throw _privateConstructorUsedError;
  double get temperature => throw _privateConstructorUsedError;
  int get maxTokens => throw _privateConstructorUsedError;

  /// Serializes this OpenAiPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpenAiPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpenAiPayloadCopyWith<OpenAiPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenAiPayloadCopyWith<$Res> {
  factory $OpenAiPayloadCopyWith(
    OpenAiPayload value,
    $Res Function(OpenAiPayload) then,
  ) = _$OpenAiPayloadCopyWithImpl<$Res, OpenAiPayload>;
  @useResult
  $Res call({
    String model,
    List<OpenAiMessage> messages,
    double temperature,
    int maxTokens,
  });
}

/// @nodoc
class _$OpenAiPayloadCopyWithImpl<$Res, $Val extends OpenAiPayload>
    implements $OpenAiPayloadCopyWith<$Res> {
  _$OpenAiPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenAiPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? messages = null,
    Object? temperature = null,
    Object? maxTokens = null,
  }) {
    return _then(
      _value.copyWith(
            model: null == model
                ? _value.model
                : model // ignore: cast_nullable_to_non_nullable
                      as String,
            messages: null == messages
                ? _value.messages
                : messages // ignore: cast_nullable_to_non_nullable
                      as List<OpenAiMessage>,
            temperature: null == temperature
                ? _value.temperature
                : temperature // ignore: cast_nullable_to_non_nullable
                      as double,
            maxTokens: null == maxTokens
                ? _value.maxTokens
                : maxTokens // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OpenAiPayloadImplCopyWith<$Res>
    implements $OpenAiPayloadCopyWith<$Res> {
  factory _$$OpenAiPayloadImplCopyWith(
    _$OpenAiPayloadImpl value,
    $Res Function(_$OpenAiPayloadImpl) then,
  ) = __$$OpenAiPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String model,
    List<OpenAiMessage> messages,
    double temperature,
    int maxTokens,
  });
}

/// @nodoc
class __$$OpenAiPayloadImplCopyWithImpl<$Res>
    extends _$OpenAiPayloadCopyWithImpl<$Res, _$OpenAiPayloadImpl>
    implements _$$OpenAiPayloadImplCopyWith<$Res> {
  __$$OpenAiPayloadImplCopyWithImpl(
    _$OpenAiPayloadImpl _value,
    $Res Function(_$OpenAiPayloadImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenAiPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? messages = null,
    Object? temperature = null,
    Object? maxTokens = null,
  }) {
    return _then(
      _$OpenAiPayloadImpl(
        model: null == model
            ? _value.model
            : model // ignore: cast_nullable_to_non_nullable
                  as String,
        messages: null == messages
            ? _value._messages
            : messages // ignore: cast_nullable_to_non_nullable
                  as List<OpenAiMessage>,
        temperature: null == temperature
            ? _value.temperature
            : temperature // ignore: cast_nullable_to_non_nullable
                  as double,
        maxTokens: null == maxTokens
            ? _value.maxTokens
            : maxTokens // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OpenAiPayloadImpl implements _OpenAiPayload {
  const _$OpenAiPayloadImpl({
    required this.model,
    required final List<OpenAiMessage> messages,
    required this.temperature,
    required this.maxTokens,
  }) : _messages = messages;

  factory _$OpenAiPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenAiPayloadImplFromJson(json);

  @override
  final String model;
  final List<OpenAiMessage> _messages;
  @override
  List<OpenAiMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  final double temperature;
  @override
  final int maxTokens;

  @override
  String toString() {
    return 'OpenAiPayload(model: $model, messages: $messages, temperature: $temperature, maxTokens: $maxTokens)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenAiPayloadImpl &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.maxTokens, maxTokens) ||
                other.maxTokens == maxTokens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    model,
    const DeepCollectionEquality().hash(_messages),
    temperature,
    maxTokens,
  );

  /// Create a copy of OpenAiPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenAiPayloadImplCopyWith<_$OpenAiPayloadImpl> get copyWith =>
      __$$OpenAiPayloadImplCopyWithImpl<_$OpenAiPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenAiPayloadImplToJson(this);
  }
}

abstract class _OpenAiPayload implements OpenAiPayload {
  const factory _OpenAiPayload({
    required final String model,
    required final List<OpenAiMessage> messages,
    required final double temperature,
    required final int maxTokens,
  }) = _$OpenAiPayloadImpl;

  factory _OpenAiPayload.fromJson(Map<String, dynamic> json) =
      _$OpenAiPayloadImpl.fromJson;

  @override
  String get model;
  @override
  List<OpenAiMessage> get messages;
  @override
  double get temperature;
  @override
  int get maxTokens;

  /// Create a copy of OpenAiPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenAiPayloadImplCopyWith<_$OpenAiPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
