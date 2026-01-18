// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

QuizHistory _$QuizHistoryFromJson(Map<String, dynamic> json) {
  return _QuizHistory.fromJson(json);
}

/// @nodoc
mixin _$QuizHistory {
  String get id => throw _privateConstructorUsedError;
  String get topic => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  int get numQuestions => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  List<Question> get questions => throw _privateConstructorUsedError;

  /// Serializes this QuizHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizHistoryCopyWith<QuizHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizHistoryCopyWith<$Res> {
  factory $QuizHistoryCopyWith(
    QuizHistory value,
    $Res Function(QuizHistory) then,
  ) = _$QuizHistoryCopyWithImpl<$Res, QuizHistory>;
  @useResult
  $Res call({
    String id,
    String topic,
    String language,
    int numQuestions,
    double score,
    DateTime date,
    List<Question> questions,
  });
}

/// @nodoc
class _$QuizHistoryCopyWithImpl<$Res, $Val extends QuizHistory>
    implements $QuizHistoryCopyWith<$Res> {
  _$QuizHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? topic = null,
    Object? language = null,
    Object? numQuestions = null,
    Object? score = null,
    Object? date = null,
    Object? questions = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
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
            score: null == score
                ? _value.score
                : score // ignore: cast_nullable_to_non_nullable
                      as double,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            questions: null == questions
                ? _value.questions
                : questions // ignore: cast_nullable_to_non_nullable
                      as List<Question>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QuizHistoryImplCopyWith<$Res>
    implements $QuizHistoryCopyWith<$Res> {
  factory _$$QuizHistoryImplCopyWith(
    _$QuizHistoryImpl value,
    $Res Function(_$QuizHistoryImpl) then,
  ) = __$$QuizHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String topic,
    String language,
    int numQuestions,
    double score,
    DateTime date,
    List<Question> questions,
  });
}

/// @nodoc
class __$$QuizHistoryImplCopyWithImpl<$Res>
    extends _$QuizHistoryCopyWithImpl<$Res, _$QuizHistoryImpl>
    implements _$$QuizHistoryImplCopyWith<$Res> {
  __$$QuizHistoryImplCopyWithImpl(
    _$QuizHistoryImpl _value,
    $Res Function(_$QuizHistoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? topic = null,
    Object? language = null,
    Object? numQuestions = null,
    Object? score = null,
    Object? date = null,
    Object? questions = null,
  }) {
    return _then(
      _$QuizHistoryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
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
        score: null == score
            ? _value.score
            : score // ignore: cast_nullable_to_non_nullable
                  as double,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        questions: null == questions
            ? _value._questions
            : questions // ignore: cast_nullable_to_non_nullable
                  as List<Question>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizHistoryImpl extends _QuizHistory {
  const _$QuizHistoryImpl({
    required this.id,
    required this.topic,
    required this.language,
    required this.numQuestions,
    required this.score,
    required this.date,
    required final List<Question> questions,
  }) : _questions = questions,
       super._();

  factory _$QuizHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizHistoryImplFromJson(json);

  @override
  final String id;
  @override
  final String topic;
  @override
  final String language;
  @override
  final int numQuestions;
  @override
  final double score;
  @override
  final DateTime date;
  final List<Question> _questions;
  @override
  List<Question> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  String toString() {
    return 'QuizHistory(id: $id, topic: $topic, language: $language, numQuestions: $numQuestions, score: $score, date: $date, questions: $questions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.numQuestions, numQuestions) ||
                other.numQuestions == numQuestions) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(
              other._questions,
              _questions,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    topic,
    language,
    numQuestions,
    score,
    date,
    const DeepCollectionEquality().hash(_questions),
  );

  /// Create a copy of QuizHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizHistoryImplCopyWith<_$QuizHistoryImpl> get copyWith =>
      __$$QuizHistoryImplCopyWithImpl<_$QuizHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizHistoryImplToJson(this);
  }
}

abstract class _QuizHistory extends QuizHistory {
  const factory _QuizHistory({
    required final String id,
    required final String topic,
    required final String language,
    required final int numQuestions,
    required final double score,
    required final DateTime date,
    required final List<Question> questions,
  }) = _$QuizHistoryImpl;
  const _QuizHistory._() : super._();

  factory _QuizHistory.fromJson(Map<String, dynamic> json) =
      _$QuizHistoryImpl.fromJson;

  @override
  String get id;
  @override
  String get topic;
  @override
  String get language;
  @override
  int get numQuestions;
  @override
  double get score;
  @override
  DateTime get date;
  @override
  List<Question> get questions;

  /// Create a copy of QuizHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizHistoryImplCopyWith<_$QuizHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
