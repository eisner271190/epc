import 'package:flutter/material.dart';
import 'package:monetization/ui/paywall_widget.dart';
import 'package:monetization/monetization_module.dart';

class SubscriptionPlansScreen extends StatelessWidget {
  const SubscriptionPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtener el provider desde el módulo de monetización (singleton o global)
    final monetizationModule = MonetizationModule();
    return Scaffold(
      appBar: AppBar(title: const Text('Planes de suscripción')),
      body: SafeArea(
        child: PaywallWidget(provider: monetizationModule.provider),
      ),
    );
  }
}
