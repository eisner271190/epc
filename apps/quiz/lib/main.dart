import 'package:auth/features/auth/domain/i_auth_service.dart';
import 'package:core/core/env/env_manager.dart';
import 'package:flutter/material.dart';
import 'package:monetization/monetization_module.dart';
import 'package:quiz_generator/shared/components/ai_registry.dart';
import 'package:quiz_generator/shared/components/auth_registry.dart';
import 'app.dart';
import 'shared/build_descriptors.dart';
import 'shared/component_registry.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvManager.load();
  await EnvManager.validate(buildDescriptors());

  // Aquí puedes continuar con el resto de la inicialización
  AiRegistry.create();
  AuthRegistry.create();
  ComponentRegistry.registryAll();
  final authService = ComponentRegistry.get<IAuthService>();
  await authService.restoreSession();
  await MonetizationModule().initialize();
  runApp(QuizGeneratorApp());
}
