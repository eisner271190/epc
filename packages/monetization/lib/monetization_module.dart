import 'package:monetization/providers/ads/admob_provider.dart';
import 'package:monetization/providers/revenuecat/revenuecat_provider.dart';

import 'core/interfaces/monetization_provider.dart';
import 'core/interfaces/ads_provider.dart';

import 'package:flutter/foundation.dart';

class MonetizationModule {
  /// Crea e inicializa el módulo de monetización usando implementaciones por defecto de los providers.
  /// Debes implementar MiMonetizationProvider y MiAdsProvider en tu app.
  static Future<MonetizationModule> initialize() async {
    final module = MonetizationModule();
    await module.init();
    return module;
  }

  late final MonetizationProvider provider;
  late final AdsProvider adsProvider;

  MonetizationModule() {
    provider = RevenueCatProvider();
    adsProvider = AdmobProvider();
  }

  Future<void> init() async {
    debugPrint('[MonetizationModule] init() called');
    debugPrint('[MonetizationModule] Inicializando módulo de monetización');
    await provider.initialize();
    debugPrint('[MonetizationModule] provider.initialize() finished');
    await adsProvider.initialize();
    debugPrint('[MonetizationModule] adsProvider.initialize() finished');
    debugPrint('[MonetizationModule] init() finished');
  }
}
