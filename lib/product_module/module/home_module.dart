import 'package:flutter_modular/flutter_modular.dart';
import 'package:shoppingcar/product_module/controller/cart_controller.dart';
import 'package:shoppingcar/product_module/controller/product_controller.dart';
import 'package:shoppingcar/product_module/pages/cart_page.dart';
import 'package:shoppingcar/product_module/pages/product_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => ProductController()),
        Bind.lazySingleton((i) => CartController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const ProductPage()),
        ChildRoute('/cartPage', child: (context, args) => const CartPage()),
      ];

  static String route = '/home/';
}
