import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shoppingcar/product_module/store/product_store.dart';
part 'product_controller.g.dart';

// ignore: library_private_types_in_public_api
class ProductController = _ProductControllerBase with _$ProductController;

abstract class _ProductControllerBase with Store {
  final ProductStore _productStore = Modular.get<ProductStore>();

  @action
  incrementQuantity(int index) {
    listProduct[index].incrementQuantity();
    _productStore.calculatePriceTotal();
  }

  @action
  addProductSelected(ProductStore product) {
    listProductSelected.add(product);
    _productStore.calculatePriceTotal();
  }

  @action
  removeAllProductSelected() {
    for (var product in listProduct) {
      for (var productSelected in listProductSelected) {
        if (product.name == productSelected.name) {
          product.quantity = 0;
        }
      }
    }
    listProductSelected.clear();
    _productStore.calculatePriceTotal();
  }

  @computed
  String get total => _productStore.total.toStringAsFixed(2);

  @computed
  ObservableList<ProductStore> get listProductSelected =>
      _productStore.productSelected;

  ObservableList<ProductStore> listProduct = ObservableList<ProductStore>.of([
    ProductStore(
      image: 'assets/imgs/maca.jpg',
      name: 'Maçã',
      description: 'Produtos da loja',
      price: 2.6,
      quantity: 0,
    ),
    ProductStore(
      image: 'assets/imgs/manga.jpg',
      name: 'Manga',
      description: 'Produtos da loja',
      price: 4.8,
      quantity: 0,
    ),
    ProductStore(
      image: 'assets/imgs/laranja.jpg',
      name: 'Laranja',
      description: 'Produtos da loja',
      price: 1.8,
      quantity: 0,
    ),
    ProductStore(
      image: 'assets/imgs/limão.jpg',
      name: 'Limão',
      description: 'Produtos da loja',
      price: 3.5,
      quantity: 0,
    ),
    ProductStore(
      image: 'assets/imgs/agua.jpg',
      name: 'Água',
      description: 'Produtos da loja',
      price: 4.3,
      quantity: 0,
    ),
    ProductStore(
      image: 'assets/imgs/ventilador.jpg',
      name: 'Ventilador',
      description: 'Produtos da loja',
      price: 153.60,
      quantity: 0,
    ),
    ProductStore(
      image: 'assets/imgs/planta.jpg',
      name: 'Planta',
      description: 'Produtos da loja',
      price: 25.8,
      quantity: 0,
    ),
    ProductStore(
      image: 'assets/imgs/notebook.jpg',
      name: 'Notebook',
      description: 'Produtos da loja',
      price: 3325.96,
      quantity: 0,
    ),
    ProductStore(
      image: 'assets/imgs/livro.jpg',
      name: 'Livro',
      description: 'Produtos da loja',
      price: 53.47,
      quantity: 0,
    ),
    ProductStore(
      image: 'assets/imgs/goiaba.jpg',
      name: 'Goiaba',
      description: 'Produtos da loja',
      price: 7.5,
      quantity: 0,
    ),
    ProductStore(
      image: 'assets/imgs/maca.jpg',
      name: 'Maçã',
      description: 'Produtos da loja',
      price: 2.6,
      quantity: 0,
    ),
    ProductStore(
      image: 'assets/imgs/maca.jpg',
      name: 'Maçã',
      description: 'Produtos da loja',
      price: 2.6,
      quantity: 0,
    ),
  ]);
}
