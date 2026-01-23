import 'env_var_descriptor.dart';
import 'i_env_validator.dart';
import 'package:cli_table/cli_table.dart';

class EnvManager {
  final List<EnvVarDescriptor> descriptors;
  final IEnvValidator? customValidator;

  EnvManager({required this.descriptors, this.customValidator});

  void _printTable(String title, List<List<String>> rows) {
    print('\n$title');
    final table = Table(header: ['Name', 'Value']);
    table.addAll(rows);
    print(table);
  }

  void logAllVars() {
    _printTable(
      'Variables de entorno:',
      descriptors.map((d) => [d.name, d.value ?? '']).toList(),
    );
  }

  void logInvalidRequiredVars(List<EnvVarDescriptor> invalids) {
    if (invalids.isNotEmpty) {
      _printTable(
        'Variables requeridas faltantes o vacías:',
        invalids.map((d) => [d.name, d.value ?? '']).toList(),
      );
    }
  }

  void logInvalidCustomVars(List<EnvVarDescriptor> invalids) {
    if (invalids.isNotEmpty) {
      _printTable(
        'Variables inválidas por validación custom:',
        invalids.map((d) => [d.name, d.value ?? '']).toList(),
      );
    }
  }

  List<EnvVarDescriptor> validateRequired() {
    return descriptors
        .where((d) => d.isRequired && (d.value == null || d.value!.isEmpty))
        .toList();
  }

  void validate() {
    logAllVars();
    final invalidRequired = validateRequired();
    logInvalidRequiredVars(invalidRequired);

    List<EnvVarDescriptor> invalidCustom = [];
    if (customValidator != null) {
      invalidCustom = customValidator!.validateCustom(descriptors);
      logInvalidCustomVars(invalidCustom);
    }
  }
}
