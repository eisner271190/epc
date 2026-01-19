import 'package:monetization/providers/ads/admob_provider.dart';
import 'package:monetization/providers/revenuecat/revenuecat_provider.dart';
import 'core/interfaces/monetization_provider.dart';
import 'core/interfaces/ads_provider.dart';
import 'core/interfaces/imonetization_module.dart';

class MonetizationModule implements IMonetizationModule {
  late final MonetizationProvider provider;
  late final AdsProvider adsProvider;

  MonetizationModule() {
    provider = RevenueCatProvider();
    adsProvider = AdmobProvider();
  }

  @override
  Future<void> initialize() async {
    MonetizationModule();
    await provider.initialize();
    await adsProvider.initialize();
  }
}
