import 'package:flutter/material.dart';

/// Sección de estado de suscripción en configuración
/// Responsabilidad: Mostrar info de suscripción y enlace a planes
class SubscriptionSection extends StatelessWidget {
  const SubscriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        leading: const Icon(
          Icons.workspace_premium,
          color: Colors.purple,
          size: 32,
        ),
        title: const Text(
          'Premium',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: const Text('Quizzes ilimitados sin publicidad'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {}, // Acción deshabilitada o personalizada
      ),
    );
  }
}
