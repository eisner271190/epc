import 'package:flutter/material.dart';
import 'package:quiz_generator/l10n/app_localizations.dart';
import 'package:quiz_generator/shared/constants/app_spacing.dart';

/// Widget que muestra el contenido de login según el estado
/// Responsabilidad: Renderizar contenido apropiado (loading/form/button)
class LoginContent extends StatelessWidget {
  final bool isLoading;
  final bool isMockMode;
  final Widget mockForm;
  final Widget googleButton;

  const LoginContent({
    super.key,
    required this.isLoading,
    required this.isMockMode,
    required this.mockForm,
    required this.googleButton,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Column(
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: AppSpacing.large),
          Text(AppLocalizations.of(context)!.processingAuth),
        ],
      );
    }

    return isMockMode ? mockForm : googleButton;
  }
}
