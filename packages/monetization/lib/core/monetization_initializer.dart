import 'package:flutter/widgets.dart';
import '../monetization_module.dart';
import 'app_initializer.dart';

class MonetizationInitializer implements AppInitializer {
  final MonetizationModule monetization;
  MonetizationInitializer(this.monetization);

  @override
  Future<void> preUi() async {
    await monetization.initialize();
  }

  @override
  Future<void> postUi(BuildContext context) async {}
}
