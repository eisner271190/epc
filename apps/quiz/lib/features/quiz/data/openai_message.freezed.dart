// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'openai_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OpenAiMessage _$OpenAiMessageFromJson(Map<String, dynamic> json) {
  return _OpenAiMessage.fromJson(json);
}

/// @nodoc
mixin _$OpenAiMessage {
  String get role => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  /// Serializes this OpenAiMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpenAiMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpenAiMessageCopyWith<OpenAiMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenAiMessageCopyWith<$Res> {
  factory $OpenAiMessageCopyWith(
    OpenAiMessage value,
    $Res Function(OpenAiMessage) then,
  ) = _$OpenAiMessageCopyWithImpl<$Res, OpenAiMessage>;
  @useResult
  $Res call({String role, String content});
}

/// @nodoc
class _$OpenAiMessageCopyWithImpl<$Res, $Val extends OpenAiMessage>
    implements $OpenAiMessageCopyWith<$Res> {
  _$OpenAiMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenAiMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? role = null, Object? content = null}) {
    return _then(
      _value.copyWith(
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OpenAiMessageImplCopyWith<$Res>
    implements $OpenAiMessageCopyWith<$Res> {
  factory _$$OpenAiMessageImplCopyWith(
    _$OpenAiMessageImpl value,
    $Res Function(_$OpenAiMessageImpl) then,
  ) = __$$OpenAiMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String role, String content});
}

/// @nodoc
class __$$OpenAiMessageImplCopyWithImpl<$Res>
    extends _$OpenAiMessageCopyWithImpl<$Res, _$OpenAiMessageImpl>
    implements _$$OpenAiMessageImplCopyWith<$Res> {
  __$$OpenAiMessageImplCopyWithImpl(
    _$OpenAiMessageImpl _value,
    $Res Function(_$OpenAiMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpenAiMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? role = null, Object? content = null}) {
    return _then(
      _$OpenAiMessageImpl(
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OpenAiMessageImpl implements _OpenAiMessage {
  const _$OpenAiMessageImpl({required this.role, required this.content});

  factory _$OpenAiMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenAiMessageImplFromJson(json);

  @override
  final String role;
  @override
  final String content;

  @override
  String toString() {
    return 'OpenAiMessage(role: $role, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenAiMessageImpl &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, role, content);

  /// Create a copy of OpenAiMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenAiMessageImplCopyWith<_$OpenAiMessageImpl> get copyWith =>
      __$$OpenAiMessageImplCopyWithImpl<_$OpenAiMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenAiMessageImplToJson(this);
  }
}

abstract class _OpenAiMessage implements OpenAiMessage {
  const factory _OpenAiMessage({
    required final String role,
    required final String content,
  }) = _$OpenAiMessageImpl;

  factory _OpenAiMessage.fromJson(Map<String, dynamic> json) =
      _$OpenAiMessageImpl.fromJson;

  @override
  String get role;
  @override
  String get content;

  /// Create a copy of OpenAiMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenAiMessageImplCopyWith<_$OpenAiMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
