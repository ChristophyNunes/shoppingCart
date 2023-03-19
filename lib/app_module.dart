import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shoppingcar/product_module/module/home_module.dart';
import 'package:shoppingcar/product_module/module/payment_module.dart';
import 'package:shoppingcar/product_module/pages/my_app.dart';
import 'package:shoppingcar/product_module/store/product_store.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => ProductStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(HomeModule.route, module: HomeModule()),
        ModuleRoute(PaymentModule.route, module: PaymentModule()),
      ];

  final Widget bootstrap = const MyApp();
}
