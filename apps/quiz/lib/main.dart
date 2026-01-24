import 'package:core/core/env/env_manager.dart';
import 'package:flutter/material.dart';
import 'package:monetization/monetization_module.dart';
import 'app.dart';
import 'core/service_factory.dart';
import 'shared/build_descriptors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvManager.load();
  await EnvManager.validate(buildDescriptors());

  // Aquí puedes continuar con el resto de la inicialización
  final authService = ServiceFactory.createAuthService();
  await authService.restoreSession();
  await MonetizationModule().initialize();
  runApp(QuizGeneratorApp());
}
