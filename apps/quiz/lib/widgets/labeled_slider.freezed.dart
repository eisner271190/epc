// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'labeled_slider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SliderConfig {
  String get label => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  double get min => throw _privateConstructorUsedError;
  double get max => throw _privateConstructorUsedError;

  /// Create a copy of SliderConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SliderConfigCopyWith<SliderConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SliderConfigCopyWith<$Res> {
  factory $SliderConfigCopyWith(
    SliderConfig value,
    $Res Function(SliderConfig) then,
  ) = _$SliderConfigCopyWithImpl<$Res, SliderConfig>;
  @useResult
  $Res call({String label, double value, double min, double max});
}

/// @nodoc
class _$SliderConfigCopyWithImpl<$Res, $Val extends SliderConfig>
    implements $SliderConfigCopyWith<$Res> {
  _$SliderConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SliderConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? min = null,
    Object? max = null,
  }) {
    return _then(
      _value.copyWith(
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as double,
            min: null == min
                ? _value.min
                : min // ignore: cast_nullable_to_non_nullable
                      as double,
            max: null == max
                ? _value.max
                : max // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SliderConfigImplCopyWith<$Res>
    implements $SliderConfigCopyWith<$Res> {
  factory _$$SliderConfigImplCopyWith(
    _$SliderConfigImpl value,
    $Res Function(_$SliderConfigImpl) then,
  ) = __$$SliderConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, double value, double min, double max});
}

/// @nodoc
class __$$SliderConfigImplCopyWithImpl<$Res>
    extends _$SliderConfigCopyWithImpl<$Res, _$SliderConfigImpl>
    implements _$$SliderConfigImplCopyWith<$Res> {
  __$$SliderConfigImplCopyWithImpl(
    _$SliderConfigImpl _value,
    $Res Function(_$SliderConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SliderConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? min = null,
    Object? max = null,
  }) {
    return _then(
      _$SliderConfigImpl(
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as double,
        min: null == min
            ? _value.min
            : min // ignore: cast_nullable_to_non_nullable
                  as double,
        max: null == max
            ? _value.max
            : max // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$SliderConfigImpl implements _SliderConfig {
  const _$SliderConfigImpl({
    required this.label,
    required this.value,
    required this.min,
    required this.max,
  });

  @override
  final String label;
  @override
  final double value;
  @override
  final double min;
  @override
  final double max;

  @override
  String toString() {
    return 'SliderConfig(label: $label, value: $value, min: $min, max: $max)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SliderConfigImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, value, min, max);

  /// Create a copy of SliderConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SliderConfigImplCopyWith<_$SliderConfigImpl> get copyWith =>
      __$$SliderConfigImplCopyWithImpl<_$SliderConfigImpl>(this, _$identity);
}

abstract class _SliderConfig implements SliderConfig {
  const factory _SliderConfig({
    required final String label,
    required final double value,
    required final double min,
    required final double max,
  }) = _$SliderConfigImpl;

  @override
  String get label;
  @override
  double get value;
  @override
  double get min;
  @override
  double get max;

  /// Create a copy of SliderConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SliderConfigImplCopyWith<_$SliderConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
