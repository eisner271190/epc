import 'package:auth/features/auth/domain/i_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_generator/providers/theme_provider.dart';
import 'package:quiz_generator/providers/locale_provider.dart';
import 'package:quiz_generator/shared/component_registry.dart';
import 'package:quiz_generator/views/widgets/premium_badge.dart';
import 'package:quiz_generator/shared/routes.dart';

/// Widget con las acciones del AppBar
/// Responsabilidad: UI de botones de acción en el AppBar
class InitialScreenActions extends StatelessWidget {
  const InitialScreenActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const PremiumBadge(),
        IconButton(
          icon: const Icon(Icons.language),
          onPressed: () {
            Provider.of<LocaleProvider>(
              context,
              listen: false,
            ).toggleLanguage();
          },
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () => Navigator.of(context).pushNamed(AppRoutes.settings),
        ),
        IconButton(
          icon: const Icon(Icons.brightness_6),
          onPressed: () {
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
          },
        ),
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () => _handleLogout(context),
        ),
      ],
    );
  }

  Future<void> _handleLogout(BuildContext context) async {
    await ComponentRegistry.get<IAuthService>().signOut();
    if (context.mounted) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacementNamed(AppRoutes.login);
    }
  }
}
