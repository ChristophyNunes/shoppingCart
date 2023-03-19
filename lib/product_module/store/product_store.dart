// ignore_for_file: unused_element

import 'package:mobx/mobx.dart';
part 'product_store.g.dart';

// ignore: library_private_types_in_public_api
class ProductStore = _ProductStoreBase with _$ProductStore;

abstract class _ProductStoreBase with Store {
  ObservableList<ProductStore> productSelected = ObservableList<ProductStore>();

  String? image;
  String name;
  String? description;
  double price;

  @observable
  double total = 0;

  @observable
  int quantity = 0;

  _ProductStoreBase({
    this.image,
    this.name = '',
    this.price = 0,
    this.description,
    this.quantity = 0,
  });

  @action
  incrementQuantity() {
    quantity++;
    calculatePriceTotal();
  }

  @action
  decrementQuantity() {
    quantity > 0 ? quantity-- : '';
    calculatePriceTotal();
  }

  @action
  double calculatePriceTotal() {
    double value = 0;
    for (var product in productSelected) {
      value += (product.quantity * product.price);
    }
    return total = value;
  }
}
