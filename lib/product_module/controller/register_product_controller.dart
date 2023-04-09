import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shoppingcar/product_module/controller/product_controller.dart';
import 'package:shoppingcar/product_module/store/product_store.dart';
part 'register_product_controller.g.dart';

// ignore: library_private_types_in_public_api
class RegisterProductController = _RegisterProductControllerBase
    with _$RegisterProductController;

abstract class _RegisterProductControllerBase with Store {
  ProductController productController = Modular.get<ProductController>();

  MoneyMaskedTextController textPrice = MoneyMaskedTextController(
    leftSymbol: "R\$ ",
    precision: 2,
    decimalSeparator: ',',
    thousandSeparator: '.',
    initialValue: 0,
  );

  @observable
  String name = '';

  @observable
  double price = 0;

  @action
  setName(String value) {
    name = value;
  }

  @action
  setPrice(String value) {
    price = textPrice.numberValue;
  }

  addProductStore() {
    ProductStore productStore = ProductStore(
      name: name,
      price: price,
    );
    productController.listProduct.add(productStore);
  }

  disposeScreen() {
    setName('');
    textPrice.clear();
    price = 0;
  }
}
