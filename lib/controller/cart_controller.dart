import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shoppingcar/models/model_product.dart';
import 'package:shoppingcar/store/product_store.dart';
part 'cart_controller.g.dart';

// ignore: library_private_types_in_public_api
class CartController = _CartControllerBase with _$CartController;

abstract class _CartControllerBase with Store {
  final ProductStore _productStore = Modular.get<ProductStore>();

  incrementQuantity(int index) {
    _productStore.incrementQuantity(index);
  }

  decrementQuantity(int index) {
    _productStore.decrementQuantity(index);
  }

  addProductSelected(Product product) {
    _productStore.addProductSelected(product);
  }

  removeProductSelected(Product product) {
    _productStore.removeProductSelected(product);
  }

  deleteAndSetQuantityZero(Product product, int index) {
    for (var product in listProduct) {
      if (product.name == listProductSelected[index].name) {
        product.quantity = 0;
      }
    }
    removeProductSelected(product);
  }

  removeAllProductSelected() {
    for (var product in listProduct) {
      for (var productSelected in listProductSelected) {
        if (product.name == productSelected.name) {
          product.quantity = 0;
        }
      }
    }
    listProductSelected.clear();
  }

  @computed
  List<Product> get listProductSelected => _productStore.productSelected;

  @computed
  List<Product> get listProduct => _productStore.listProduct;
}
