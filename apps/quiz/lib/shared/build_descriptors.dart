import 'package:core/core/env/env_var_descriptor.dart';
import 'package:quiz_generator/features/auth/config/auth_env.dart';

List<EnvVarDescriptor> buildDescriptors() {
  return [...AuthEnv().buildListEnvs()];
}
