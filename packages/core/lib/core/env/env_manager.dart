import 'package:core/core/log/logger.dart';

import 'env_var_descriptor.dart';
import 'i_env_validator.dart';
import 'package:cli_table/cli_table.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvManager {
  static Future<void> load() async {
    final profile = const String.fromEnvironment(
      'PROFILE',
      defaultValue: 'mock',
    );
    final envFile = 'assets/.env.$profile';
    _logLoadingEnvironment(envFile);
    await dotenv.load(fileName: envFile);
  }

  final List<EnvVarDescriptor> descriptors;
  final IEnvValidator? customValidator;

  EnvManager({required this.descriptors, this.customValidator});

  void _printTable(String title, List<List<String>> rows) {
    print('\n$title');

    final table = Table(header: ['Name', 'Value'], columnWidths: [30, 40]);

    for (final row in rows) {
      table.add(row);
    }

    // Dividir en líneas e imprimir una por una
    final tableString = table.toString();
    final lines = tableString.split('\n');

    for (final line in lines) {
      print(line);
    }
  }

  void logAllVars() {
    _printTable(
      'Variables de entorno:',
      descriptors.map((d) => [d.name, dotenv.env[d.name] ?? '']).toList(),
    );
  }

  void logInvalidRequiredVars(List<EnvVarDescriptor> invalids) {
    if (invalids.isNotEmpty) {
      _printTable(
        'Variables requeridas faltantes o vacías:',
        invalids.map((d) => [d.name, dotenv.env[d.name] ?? '']).toList(),
      );
    }
  }

  void logInvalidCustomVars(List<EnvVarDescriptor> invalids) {
    if (invalids.isNotEmpty) {
      _printTable(
        'Variables inválidas por validación custom:',
        invalids.map((d) => [d.name, dotenv.env[d.name] ?? '']).toList(),
      );
    }
  }

  List<EnvVarDescriptor> validateRequired() {
    return descriptors.where((d) {
      final value = dotenv.env[d.name];
      return d.isRequired && (value == null || value.isEmpty);
    }).toList();
  }

  static Future<void> validate(List<EnvVarDescriptor> descriptors) async {
    Logger.log('Validating environment variables...');
    final manager = EnvManager(descriptors: descriptors);
    manager.logAllVars();
    final invalidRequired = manager.validateRequired();
    manager.logInvalidRequiredVars(invalidRequired);
    // Si necesitas validación custom, puedes extender aquí
  }

  static void _logLoadingEnvironment(String file) {
    // Puedes usar tu logger central aquí si lo deseas
    print('[APP] Loading environment: $file');
  }
}
