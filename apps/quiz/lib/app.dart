import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'config/app_theme.dart';
import 'core/service_factory.dart';
import 'core/routes.dart';
import 'l10n/app_localizations.dart';
import 'providers/theme_provider.dart';
import 'providers/locale_provider.dart';
import 'features/quiz/application/quiz_provider.dart';
import 'features/history/application/history_provider.dart';
import 'features/auth/domain/i_auth_service.dart';
import 'features/auth/presentation/login_page.dart';
import 'views/initial_screen.dart';
import 'views/settings_screen.dart';
import 'features/quiz/presentation/quiz_screen.dart';
import 'features/quiz/presentation/result_screen.dart';
import 'features/history/presentation/history_screen.dart';
import 'views/screens/subscription_plans_screen.dart';

class QuizGeneratorApp extends StatelessWidget {
  QuizGeneratorApp({super.key});

  final IAuthService authService = ServiceFactory.createAuthService();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => QuizProvider()),
        ChangeNotifierProvider(create: (_) => HistoryProvider()),
      ],
      child: Consumer2<ThemeProvider, LocaleProvider>(
        builder: (context, themeProvider, localeProvider, child) {
          return StreamBuilder(
            stream: authService.authStateChanges,
            builder: (context, snapshot) {
              final isAuthenticated = snapshot.hasData && snapshot.data != null;

              return MaterialApp(
                title: 'Quiz Generator',
                locale: localeProvider.locale,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('es'), // Spanish
                  Locale('en'), // English
                ],
                themeMode: themeProvider.themeMode,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                debugShowCheckedModeBanner: false,
                home: isAuthenticated
                    ? const InitialScreen()
                    : const LoginPage(),
                routes: {
                  AppRoutes.quiz: (context) => const QuizScreen(),
                  AppRoutes.result: (context) => const ResultScreen(),
                  AppRoutes.settings: (context) => const SettingsScreen(),
                  AppRoutes.history: (context) => const HistoryScreen(),
                  AppRoutes.subscription: (context) =>
                      const SubscriptionPlansScreen(),
                },
              );
            },
          );
        },
      ),
    );
  }
}
