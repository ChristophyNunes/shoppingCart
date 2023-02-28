import 'package:flutter_modular/flutter_modular.dart';
import 'package:shoppingcar/controller/cart_controller.dart';
import 'package:shoppingcar/controller/product_controller.dart';
import 'package:shoppingcar/pages/product_page.dart';
import 'package:shoppingcar/pages/cart_page.dart';
import 'package:shoppingcar/store/product_store.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => ProductController()),
        Bind.lazySingleton((i) => ProductStore()),
        Bind.lazySingleton((i) => CartController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => ProductPage()),
        ChildRoute('/cartPage', child: (context, args) => CartPage())
      ];
}
