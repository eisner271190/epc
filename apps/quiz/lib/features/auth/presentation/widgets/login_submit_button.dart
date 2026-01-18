import 'package:flutter/material.dart';
import 'package:quiz_generator/l10n/app_localizations.dart';

/// Widget de botón de login
/// Responsabilidad: Botón de submit con loading
class LoginSubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const LoginSubmitButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Text(AppLocalizations.of(context)!.loginButton),
      ),
    );
  }
}
