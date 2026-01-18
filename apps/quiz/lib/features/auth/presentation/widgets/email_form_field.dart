import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';

/// Widget de campo de email con validación
/// Responsabilidad: Input y validación de email
class EmailFormField extends StatelessWidget {
  final TextEditingController controller;

  const EmailFormField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)!.userLabel,
        hintText: AppLocalizations.of(context)!.userHint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        prefixIcon: const Icon(Icons.person),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!.pleaseEnterUser;
        }
        return null;
      },
    );
  }
}
