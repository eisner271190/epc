import 'package:flutter/material.dart';
import 'package:quiz_generator/l10n/app_localizations.dart';
import 'package:quiz_generator/core/routes.dart';

/// Diálogo de actualización a premium
/// Responsabilidad: Mostrar mensaje cuando se alcanza límite gratuito
class UpgradeDialog extends StatelessWidget {
  const UpgradeDialog({super.key});

  static void show(BuildContext context) {
    showDialog(context: context, builder: (ctx) => const UpgradeDialog());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.limitReached),
      content: Text(AppLocalizations.of(context)!.limitReachedMessage),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(AppLocalizations.of(context)!.cancelButton),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, AppRoutes.subscription);
          },
          child: Text(AppLocalizations.of(context)!.viewPlansButton),
        ),
      ],
    );
  }
}
