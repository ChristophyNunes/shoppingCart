import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shoppingcar/models/model_product.dart';
import 'package:shoppingcar/store/product_store.dart';
part 'product_controller.g.dart';

// ignore: library_private_types_in_public_api
class ProductController = _ProductControllerBase with _$ProductController;

abstract class _ProductControllerBase with Store {
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

  @computed
  List<Product> get listProductSelected => _productStore.productSelected;

  @computed
  List<Product> get listProduct => _productStore.listProduct;
}
