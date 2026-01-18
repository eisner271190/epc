import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';

/// Widget de campo de contraseña con validación
/// Responsabilidad: Input y validación de password
class PasswordFormField extends StatelessWidget {
  final TextEditingController controller;

  const PasswordFormField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)!.passwordLabel,
        hintText: AppLocalizations.of(context)!.passwordHint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        prefixIcon: const Icon(Icons.lock),
      ),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!.pleaseEnterPassword;
        }
        return null;
      },
    );
  }
}
