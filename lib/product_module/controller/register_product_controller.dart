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

  @observable
  String description = '';

  String errorString = '';

  @action
  setName(String value) {
    name = value;
  }

  @action
  setDescription(String value) {
    description = value;
  }

  @action
  setPrice(String value) {
    price = textPrice.numberValue;
  }

  setErrorString(String value) {
    errorString = value;
  }

  addProductStore() {
    ProductStore productStore = ProductStore(
      name: name,
      description: description,
      price: price,
    );
    productController.listProduct.add(productStore);
  }

  bool isValidRegister() {
    if (name == '') {
      setErrorString('Nome não pode ser vazio');
      return true;
    }
    if (description == '') {
      setErrorString('Descrição não pode ser vazio');
      return true;
    }
    if (price == 0) {
      setErrorString('Preço não pode ser zero');
      return true;
    }
    return false;
  }

  disposeScreen() {
    setName('');
    setDescription('');
    textPrice.clear();
    price = 0;
  }
}
