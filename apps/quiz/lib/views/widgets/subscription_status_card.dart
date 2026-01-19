import 'package:flutter/material.dart';
import 'package:quiz_generator/shared/constants/app_spacing.dart';
import '../../core/routes.dart';

/// Widget que muestra el estado de suscripción y quizzes restantes
/// Responsabilidad: UI de información de uso de quizzes
class SubscriptionStatusCard extends StatelessWidget {
  const SubscriptionStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.subscription);
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: AppSpacing.large),
        color: Colors.purple.shade50,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.large),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Premium: quizzes ilimitados',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.purple,
                ),
              ),
              Icon(Icons.workspace_premium, color: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
