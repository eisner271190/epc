import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import '../../core/config/monetization_env.dart';
import '../../core/interfaces/monetization_provider.dart';
import '../../core/models/subscription_plan.dart';
import '../../core/models/user_entitlement.dart';

class RevenueCatProvider implements MonetizationProvider {
  static final RevenueCatProvider _instance = RevenueCatProvider._internal();
  factory RevenueCatProvider() => _instance;
  RevenueCatProvider._internal();
  String _elapsed(Stopwatch sw) => '[${sw.elapsedMilliseconds}ms]';
  Offerings? _offerings;
  final _entitlementController = StreamController<UserEntitlement>.broadcast();
  static const _entitlementKey = 'revenuecat_entitlement_cache';

  @override
  Future<void> initialize() async {
    final sw = Stopwatch()..start();
    debugPrint(
      '[RevenueCatProvider] Inicializando RevenueCat... ${_elapsed(sw)}',
    );
    if (kIsWeb) {
      debugPrint(
        '[RevenueCatProvider] Web detectado, no se inicializa RevenueCat. ${_elapsed(sw)}',
      );
      return;
    }
    try {
      await Purchases.setLogLevel(LogLevel.debug);
      debugPrint('[RevenueCatProvider] LogLevel configurado. ${_elapsed(sw)}');
      await Purchases.configure(
        PurchasesConfiguration(MonetizationEnv.revenueCatKey),
      );
      debugPrint('[RevenueCatProvider] Purchases configurado. ${_elapsed(sw)}');
      _offerings = await Purchases.getOfferings();
      debugPrint('[RevenueCatProvider] Offerings obtenidos. ${_elapsed(sw)}');
      await Purchases.getCustomerInfo();
      debugPrint('[RevenueCatProvider] CustomerInfo obtenido. ${_elapsed(sw)}');
      debugPrint(
        '[RevenueCatProvider] RevenueCat inicializado correctamente. ${_elapsed(sw)}',
      );
      _emitEntitlement();
    } catch (e) {
      debugPrint(
        '[RevenueCatProvider] Error al inicializar RevenueCat: $e ${_elapsed(sw)}',
      );
      rethrow;
    }
  }

  @override
  Future<List<SubscriptionPlan>> getPlans() async {
    debugPrint('[RevenueCatProvider] Obteniendo planes de suscripción...');
    final plans = <SubscriptionPlan>[];
    if (_offerings?.current != null) {
      for (final package in _offerings!.current!.availablePackages) {
        plans.add(
          SubscriptionPlan(
            id: package.identifier,
            name: package.storeProduct.title,
            price: package.storeProduct.price.toString(),
            period: package.storeProduct.subscriptionPeriod ?? '',
          ),
        );
      }
      debugPrint(
        '[RevenueCatProvider] Planes obtenidos de RevenueCat: '
        '${plans.map((e) => '{id: ${e.id}, name: ${e.name}, price: ${e.price}, period: ${e.period}}').toList()}',
      );
    }
    return plans;
  }

  @override
  Future<void> purchase(String planId) async {
    final sw = Stopwatch()..start();
    debugPrint(
      '[RevenueCatProvider] Intentando comprar plan: $planId ${_elapsed(sw)}',
    );
    final packages = _offerings?.current?.availablePackages;
    final package = packages?.firstWhereOrNull((p) => p.identifier == planId);
    if (package != null) {
      try {
        final params = PurchaseParams.package(package);
        await Purchases.purchase(params);
        debugPrint(
          '[RevenueCatProvider] purchase() completado. ${_elapsed(sw)}',
        );
        await Purchases.getCustomerInfo();
        debugPrint(
          '[RevenueCatProvider] CustomerInfo actualizado. ${_elapsed(sw)}',
        );
        debugPrint(
          '[RevenueCatProvider] Compra exitosa para plan: $planId ${_elapsed(sw)}',
        );
        _emitEntitlement();
      } catch (e) {
        debugPrint(
          '[RevenueCatProvider] Error al comprar plan $planId: $e ${_elapsed(sw)}',
        );
        rethrow;
      }
    } else {
      debugPrint(
        '[RevenueCatProvider] Plan $planId no encontrado entre los paquetes disponibles. ${_elapsed(sw)}',
      );
    }
  }

  @override
  Future<void> restore() async {
    final sw = Stopwatch()..start();
    debugPrint('[RevenueCatProvider] Restaurando compras... ${_elapsed(sw)}');
    try {
      await Purchases.restorePurchases();
      debugPrint(
        '[RevenueCatProvider] restorePurchases() completado. ${_elapsed(sw)}',
      );
      await Purchases.getCustomerInfo();
      debugPrint(
        '[RevenueCatProvider] CustomerInfo actualizado. ${_elapsed(sw)}',
      );
      debugPrint(
        '[RevenueCatProvider] Compras restauradas correctamente. ${_elapsed(sw)}',
      );
      _emitEntitlement();
    } catch (e) {
      debugPrint(
        '[RevenueCatProvider] Error al restaurar compras: $e ${_elapsed(sw)}',
      );
      rethrow;
    }
  }

  @override
  Stream<UserEntitlement> entitlementStream() {
    return _entitlementController.stream;
  }

  void _emitEntitlement() async {
    final sw = Stopwatch()..start();
    debugPrint(
      '[RevenueCatProvider] Emisión de entitlement... ${_elapsed(sw)}',
    );
    final prefs = await SharedPreferences.getInstance();
    debugPrint(
      '[RevenueCatProvider] SharedPreferences obtenido. ${_elapsed(sw)}',
    );
    try {
      final info = await Purchases.getCustomerInfo();
      debugPrint('[RevenueCatProvider] CustomerInfo obtenido. ${_elapsed(sw)}');
      final entitlements = info.entitlements.active.values;
      if (entitlements.isNotEmpty) {
        final planId = entitlements.first.identifier;
        final ent = UserEntitlement(isActive: true, planId: planId);
        _entitlementController.add(ent);
        prefs.setString(
          _entitlementKey,
          jsonEncode({'isActive': true, 'planId': planId}),
        );
        debugPrint(
          '[RevenueCatProvider] Entitlement activo emitido y guardado en caché. ${_elapsed(sw)}',
        );
      } else {
        _entitlementController.add(UserEntitlement(isActive: false));
        prefs.setString(_entitlementKey, jsonEncode({'isActive': false}));
        debugPrint(
          '[RevenueCatProvider] No hay entitlement activo, se guardó estado inactivo. ${_elapsed(sw)}',
        );
      }
    } catch (e) {
      debugPrint(
        '[RevenueCatProvider] Error al emitir entitlement: $e ${_elapsed(sw)}',
      );
      // Si falla, intenta emitir el caché
      final cached = prefs.getString(_entitlementKey);
      if (cached != null) {
        final data = jsonDecode(cached);
        _entitlementController.add(
          UserEntitlement(
            isActive: data['isActive'] ?? false,
            planId: data['planId'],
          ),
        );
        debugPrint(
          '[RevenueCatProvider] Entitlement emitido desde caché. ${_elapsed(sw)}',
        );
      }
    }
  }
}
