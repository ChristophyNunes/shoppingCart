import 'package:flutter_modular/flutter_modular.dart';
import 'package:shoppingcar/payment_module/pages/controller/payment_controller.dart';
import 'package:shoppingcar/payment_module/pages/payment_page.dart';
import 'package:shoppingcar/product_module/store/product_store.dart';

class PaymentModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => PaymentController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const PaymentPage()),
      ];

  static String route = '/payment/';
}
