import 'package:core/core/env/env_var_descriptor.dart';
import 'package:core/app/app_env.dart';
import 'package:quiz_generator/features/quiz/config/quiz_env.dart';
import 'package:ai/ai/config/ai_env.dart';
import 'package:auth/features/auth/config/auth_env.dart';

List<EnvVarDescriptor> buildDescriptors() {
  return [
    ...AuthEnv().buildListEnvs(),
    ...QuizEnv().buildListEnvs(),
    ...AiEnv().buildListEnvs(),
    ...AppEnv().buildListEnvs(),
  ];
}
