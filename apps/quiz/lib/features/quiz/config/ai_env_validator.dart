import 'package:core/core/env/env_validator.dart';
import 'package:core/core/helper/env_helper.dart';
import 'ai_env.dart';

class AiEnvValidator implements EnvValidator {
  @override
  void validate() {
    EnvHelper.validate(AiEnv.requiredKeys);
  }
}
