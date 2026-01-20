import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_generator/features/history/application/history_provider.dart';
import 'package:quiz_generator/l10n/app_localizations.dart';
import 'package:core/core/constants/app_spacing.dart';

/// Widget para la sección de input de tema
/// Responsabilidad: UI para seleccionar o escribir el tema del quiz
class TopicInputSection extends StatelessWidget {
  final TextEditingController controller;

  const TopicInputSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final history = Provider.of<HistoryProvider>(context);

    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.topicLabel,
          ),
          onSubmitted: (v) => history.addTopic(v),
        ),
        const SizedBox(height: AppSpacing.large),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.previousTopicsLabel,
          ),
          items: history.topics
              .map((t) => DropdownMenuItem(value: t.name, child: Text(t.name)))
              .toList(),
          onChanged: (v) {
            if (v != null) controller.text = v;
          },
        ),
      ],
    );
  }
}
