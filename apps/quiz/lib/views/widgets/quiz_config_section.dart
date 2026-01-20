import 'package:flutter/material.dart';
import 'package:quiz_generator/features/quiz/application/quiz_provider.dart';
import 'package:quiz_generator/l10n/app_localizations.dart';
import 'package:core/core/constants/app_spacing.dart';
import 'package:quiz_generator/widgets/labeled_slider.dart';

/// Sección de configuración de quiz
/// Responsabilidad: Controles para parámetros del quiz
class QuizConfigSection extends StatelessWidget {
  final QuizProvider quiz;
  final VoidCallback onChanged;

  const QuizConfigSection({
    super.key,
    required this.quiz,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          AppLocalizations.of(context)!.configTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: AppSpacing.large),
        LabeledSlider(
          config: SliderConfig(
            label: AppLocalizations.of(context)!.numQuestionsLabel,
            value: quiz.numQuestions.toDouble(),
            min: 5,
            max: 50,
          ),
          onChanged: (v) {
            quiz.numQuestions = v.toInt();
            onChanged();
          },
        ),
        const SizedBox(height: AppSpacing.medium),
        LabeledSlider(
          config: SliderConfig(
            label: AppLocalizations.of(context)!.optionsCountLabel,
            value: quiz.optionsCount.toDouble(),
            min: 2,
            max: 5,
          ),
          onChanged: (v) {
            quiz.optionsCount = v.toInt();
            onChanged();
          },
        ),
        const SizedBox(height: AppSpacing.medium),
        DropdownButtonFormField<String>(
          initialValue: quiz.language,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.languageLabel,
          ),
          items: [
            DropdownMenuItem(
              value: 'Español',
              child: Text(AppLocalizations.of(context)!.spanish),
            ),
            DropdownMenuItem(
              value: 'English',
              child: Text(AppLocalizations.of(context)!.english),
            ),
          ],
          onChanged: (v) {
            if (v != null) {
              quiz.language = v;
              onChanged();
            }
          },
        ),
      ],
    );
  }
}
