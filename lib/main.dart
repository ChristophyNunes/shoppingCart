import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shoppingcar/module/app_module.dart';
import 'package:shoppingcar/pages/my_app.dart';

import 'utils/page_route_observer.dart';

void main() {
  PageRouteObserver myObserver = PageRouteObserver();
  Modular.setObservers([myObserver]);

  Modular.setInitialRoute('/');
  return runApp(ModularApp(
    module: AppModule(),
    child: const MyApp(),
  ));
}
