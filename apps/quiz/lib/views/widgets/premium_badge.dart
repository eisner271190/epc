import 'package:flutter/material.dart';
import 'package:quiz_generator/shared/constants/app_spacing.dart';
import 'package:provider/provider.dart';
import 'package:monetization/core/models/user_entitlement.dart';

/// Widget que muestra el badge de Premium en el AppBar
/// Responsabilidad: UI del indicador de estado premium
class PremiumBadge extends StatelessWidget {
  const PremiumBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final entitlement = Provider.of<UserEntitlement?>(context);
    final isPremium = entitlement?.isActive == true;

    return Padding(
      padding: const EdgeInsets.only(right: AppSpacing.small),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.medium,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.purple, Colors.deepPurple],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.workspace_premium,
                color: Colors.white,
                size: AppSpacing.large,
              ),
              const SizedBox(width: AppSpacing.tiny),
              Text(
                isPremium ? 'PREMIUM' : 'FREE',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
