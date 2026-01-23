import 'env_var_descriptor.dart';

abstract class IEnvValidator {
  List<EnvVarDescriptor> validateCustom(List<EnvVarDescriptor> envVars);
}
