import 'package:core/core/env/env_validator.dart';
import 'package:core/core/helper/env_helper.dart';
import 'auth_env.dart';

class AuthEnvValidator implements EnvValidator {
  @override
  void validate() {
    EnvHelper.validate(AuthEnv.requiredKeys);
  }
}
