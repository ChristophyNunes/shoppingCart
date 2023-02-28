import 'package:mobx/mobx.dart';
import 'package:shoppingcar/models/model_product.dart';
part 'product_store.g.dart';

// ignore: library_private_types_in_public_api
class ProductStore = _ProductStoreBase with _$ProductStore;

abstract class _ProductStoreBase with Store {
  List<Product> productSelected = [];

  void addProductSelected(Product product) {
    productSelected.add(product);
  }

  void removeProductSelected(Product product) {
    productSelected.remove(product);
  }

  incrementQuantity(int index) {
    listProduct[index].quantity++;
  }

  decrementQuantity(int index) {
    listProduct[index].quantity > 0 ? listProduct[index].quantity-- : '';
  }

  List<Product> listProduct = [
    Product(
      image: 'assets/imgs/maca.jpg',
      name: 'Maçã',
      description: 'Produtos da loja',
      price: 2.6,
      quantity: 0,
    ),
    Product(
      image: 'assets/imgs/manga.jpg',
      name: 'Manga',
      description: 'Produtos da loja',
      price: 4.8,
      quantity: 0,
    ),
    Product(
      image: 'assets/imgs/laranja.jpg',
      name: 'Laranja',
      description: 'Produtos da loja',
      price: 1.8,
      quantity: 0,
    ),
    Product(
      image: 'assets/imgs/limão.jpg',
      name: 'Limão',
      description: 'Produtos da loja',
      price: 3.5,
      quantity: 0,
    ),
    Product(
      image: 'assets/imgs/agua.jpg',
      name: 'Água',
      description: 'Produtos da loja',
      price: 4.3,
      quantity: 0,
    ),
    Product(
      image: 'assets/imgs/ventilador.jpg',
      name: 'Ventilador',
      description: 'Produtos da loja',
      price: 153.60,
      quantity: 0,
    ),
    Product(
      image: 'assets/imgs/planta.jpg',
      name: 'Planta',
      description: 'Produtos da loja',
      price: 25.8,
      quantity: 0,
    ),
    Product(
      image: 'assets/imgs/notebook.jpg',
      name: 'Notebook',
      description: 'Produtos da loja',
      price: 3325.96,
      quantity: 0,
    ),
    Product(
      image: 'assets/imgs/livro.jpg',
      name: 'Livro',
      description: 'Produtos da loja',
      price: 53.47,
      quantity: 0,
    ),
    Product(
      image: 'assets/imgs/goiaba.jpg',
      name: 'Goiaba',
      description: 'Produtos da loja',
      price: 7.5,
      quantity: 0,
    ),
  ];
}
