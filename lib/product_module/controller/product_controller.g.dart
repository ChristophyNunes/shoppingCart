// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductController on _ProductControllerBase, Store {
  Computed<String>? _$totalComputed;

  @override
  String get total => (_$totalComputed ??= Computed<String>(() => super.total,
          name: '_ProductControllerBase.total'))
      .value;
  Computed<ObservableList<ProductStore>>? _$listProductSelectedComputed;

  @override
  ObservableList<ProductStore> get listProductSelected =>
      (_$listProductSelectedComputed ??= Computed<ObservableList<ProductStore>>(
              () => super.listProductSelected,
              name: '_ProductControllerBase.listProductSelected'))
          .value;

  late final _$_ProductControllerBaseActionController =
      ActionController(name: '_ProductControllerBase', context: context);

  @override
  dynamic incrementQuantity(int index) {
    final _$actionInfo = _$_ProductControllerBaseActionController.startAction(
        name: '_ProductControllerBase.incrementQuantity');
    try {
      return super.incrementQuantity(index);
    } finally {
      _$_ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addProductSelected(ProductStore product) {
    final _$actionInfo = _$_ProductControllerBaseActionController.startAction(
        name: '_ProductControllerBase.addProductSelected');
    try {
      return super.addProductSelected(product);
    } finally {
      _$_ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeAllProductSelected() {
    final _$actionInfo = _$_ProductControllerBaseActionController.startAction(
        name: '_ProductControllerBase.removeAllProductSelected');
    try {
      return super.removeAllProductSelected();
    } finally {
      _$_ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
total: ${total},
listProductSelected: ${listProductSelected}
    ''';
  }
}
