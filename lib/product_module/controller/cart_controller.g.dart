// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartController on _CartControllerBase, Store {
  Computed<ObservableList<ProductStore>>? _$listProductSelectedComputed;

  @override
  ObservableList<ProductStore> get listProductSelected =>
      (_$listProductSelectedComputed ??= Computed<ObservableList<ProductStore>>(
              () => super.listProductSelected,
              name: '_CartControllerBase.listProductSelected'))
          .value;
  Computed<ObservableList<ProductStore>>? _$listProductComputed;

  @override
  ObservableList<ProductStore> get listProduct => (_$listProductComputed ??=
          Computed<ObservableList<ProductStore>>(() => super.listProduct,
              name: '_CartControllerBase.listProduct'))
      .value;
  Computed<String>? _$totalComputed;

  @override
  String get total => (_$totalComputed ??= Computed<String>(() => super.total,
          name: '_CartControllerBase.total'))
      .value;

  late final _$_CartControllerBaseActionController =
      ActionController(name: '_CartControllerBase', context: context);

  @override
  dynamic incrementQuantity(int index) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.incrementQuantity');
    try {
      return super.incrementQuantity(index);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic decrementQuantity(int index) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.decrementQuantity');
    try {
      return super.decrementQuantity(index);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeProductSelected(ProductStore product) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.removeProductSelected');
    try {
      return super.removeProductSelected(product);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteAndSetQuantityZero(ProductStore product, int index) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.deleteAndSetQuantityZero');
    try {
      return super.deleteAndSetQuantityZero(product, index);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeAllProductSelected() {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.removeAllProductSelected');
    try {
      return super.removeAllProductSelected();
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listProductSelected: ${listProductSelected},
listProduct: ${listProduct},
total: ${total}
    ''';
  }
}
