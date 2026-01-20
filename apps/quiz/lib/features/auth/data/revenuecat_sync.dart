import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:quiz_generator/features/auth/domain/auth_user.dart';

/// Sincroniza el usuario autenticado con RevenueCat
Future<void> syncRevenueCatUser(AuthUser? user) async {
  if (user == null) return;
  try {
    await Purchases.logIn(user.id);
  } catch (e) {
    // Manejo de error opcional
  }
}
