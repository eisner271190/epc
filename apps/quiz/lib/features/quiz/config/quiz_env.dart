import 'package:core/core/env/env_var_descriptor.dart';
import 'package:core/core/env/i_env.dart';
import 'package:core/core/helper/env_helper.dart';
import 'package:core/core/helper/type_parser.dart';

class QuizEnv implements IEnv {
  QuizEnv();

  // Keys
  static const String keyLanguage = 'QUIZ_LANGUAGE';
  static const String keyNumQuestions = 'QUIZ_NUM_QUESTIONS';
  static const String keyOptionsCount = 'QUIZ_OPTIONS_COUNT';
  static const String keyTimePerQuestionSeconds =
      'QUIZ_TIME_PER_QUESTION_SECONDS';

  static String get language => EnvHelper.getEnv(keyLanguage);

  static int get numQuestions =>
      TypeParser.parseInt(EnvHelper.getEnv(keyNumQuestions), 10);

  static int get optionsCount =>
      TypeParser.parseInt(EnvHelper.getEnv(keyOptionsCount), 4);

  static Duration get timePerQuestion => Duration(
    seconds: TypeParser.parseInt(
      EnvHelper.getEnv(keyTimePerQuestionSeconds),
      30,
    ),
  );

  @override
  List<EnvVarDescriptor> buildListEnvs() {
    return [
      EnvVarDescriptor(name: keyLanguage, isRequired: false),
      EnvVarDescriptor(name: keyNumQuestions, isRequired: false),
      EnvVarDescriptor(name: keyOptionsCount, isRequired: false),
      EnvVarDescriptor(name: keyTimePerQuestionSeconds, isRequired: false),
    ];
  }
}
