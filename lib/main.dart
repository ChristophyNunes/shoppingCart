import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shoppingcar/app_module.dart';
import 'package:shoppingcar/product_module/module/home_module.dart';
import 'package:shoppingcar/product_module/pages/my_app.dart';
import 'utils/page_route_observer.dart';

void main() {
  PageRouteObserver myObserver = PageRouteObserver();
  Modular.setObservers([myObserver]);

  Modular.setInitialRoute(HomeModule.route);
  return runApp(ModularApp(
    module: AppModule(),
    child: const MyApp(),
  ));
}
