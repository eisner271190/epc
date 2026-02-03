import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:core/core/log/logger.dart';

import '../domain/auth_user.dart';

/// Sincroniza el usuario autenticado con RevenueCat
Future<void> syncRevenueCatUser(AuthUser? user) async {
  if (user == null) return;
  try {
    Logger.info(
      'auth.revenuecat.sync.start',
      data: {'userId': _maskId(user.id)},
    );
    await Purchases.logIn(user.id);
    Logger.info(
      'auth.revenuecat.sync.success',
      data: {'userId': _maskId(user.id)},
    );
  } catch (e, st) {
    Logger.error(
      'auth.revenuecat.sync.error',
      data: {'userId': _maskId(user.id)},
      error: e,
      stackTrace: st,
    );
  }
}

String _maskId(String id) {
  if (id.length <= 4) return '****';
  final visible = id.substring(id.length - 4);
  return '***${visible}';
}
