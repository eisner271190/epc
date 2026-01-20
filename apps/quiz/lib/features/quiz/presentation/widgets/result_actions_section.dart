import 'package:flutter/material.dart';
import 'package:quiz_generator/l10n/app_localizations.dart';
import 'package:core/core/constants/app_spacing.dart';

/// Widget con botones de acción post-quiz
/// Responsabilidad: Renderizar botones de repetir y volver
class ResultActionsSection extends StatelessWidget {
  final VoidCallback onRepeat;
  final VoidCallback onBackToStart;

  const ResultActionsSection({
    super.key,
    required this.onRepeat,
    required this.onBackToStart,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: onRepeat, child: Text(l10n.repeatQuizButton)),
        const SizedBox(width: AppSpacing.medium),
        ElevatedButton(
          onPressed: onBackToStart,
          child: Text(l10n.backToStartButton),
        ),
      ],
    );
  }
}
