import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shoppingcar/product_module/controller/product_controller.dart';
import 'package:shoppingcar/product_module/store/product_store.dart';
part 'cart_controller.g.dart';

// ignore: library_private_types_in_public_api
class CartController = _CartControllerBase with _$CartController;

abstract class _CartControllerBase with Store {
  final ProductStore _productStore = Modular.get<ProductStore>();
  final ProductController _productController = Modular.get<ProductController>();

  ObservableList<ProductStore> productSelected = ObservableList<ProductStore>();

  @computed
  ObservableList<ProductStore> get listProductSelected =>
      _productStore.productSelected;

  @computed
  ObservableList<ProductStore> get listProduct =>
      _productController.listProduct;

  @computed
  String get total => _productStore.total.toStringAsFixed(2);

  @action
  incrementQuantity(int index) {
    listProductSelected[index].quantity++;
    _productStore.calculatePriceTotal();
  }

  @action
  decrementQuantity(int index) {
    if (listProductSelected[index].quantity > 1) {
      listProductSelected[index].quantity--;
      _productStore.calculatePriceTotal();
    } else {
      listProductSelected.remove(listProductSelected[index]);
    }
  }

  @action
  removeProductSelected(ProductStore product) {
    listProductSelected.remove(product);
    _productStore.calculatePriceTotal();
  }

  @action
  deleteAndSetQuantityZero(ProductStore product, int index) {
    for (var product in _productController.listProduct) {
      if (product.name == listProductSelected[index].name) {
        product.quantity = 0;
      }
    }
    removeProductSelected(product);
    _productStore.calculatePriceTotal();
  }

  @action
  removeAllProductSelected() {
    for (var product in _productController.listProduct) {
      for (var productSelected in listProductSelected) {
        if (product.name == productSelected.name) {
          product.quantity = 0;
        }
      }
    }
    listProductSelected.clear();
    _productStore.calculatePriceTotal();
  }
}
