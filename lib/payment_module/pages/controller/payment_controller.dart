// ignore_for_file: library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shoppingcar/product_module/store/product_store.dart';
part 'payment_controller.g.dart';

class PaymentController = _PaymentControllerBase with _$PaymentController;

abstract class _PaymentControllerBase with Store {
  final ProductStore _productStore = Modular.get<ProductStore>();

  @computed
  ObservableList<ProductStore> get listProductSelected =>
      _productStore.productSelected;

  @computed
  String get total => _productStore.total.toStringAsFixed(2);
}
