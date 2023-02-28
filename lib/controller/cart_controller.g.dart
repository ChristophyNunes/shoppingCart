// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartController on _CartControllerBase, Store {
  Computed<List<Product>>? _$listProductSelectedComputed;

  @override
  List<Product> get listProductSelected => (_$listProductSelectedComputed ??=
          Computed<List<Product>>(() => super.listProductSelected,
              name: '_CartControllerBase.listProductSelected'))
      .value;
  Computed<List<Product>>? _$listProductComputed;

  @override
  List<Product> get listProduct => (_$listProductComputed ??=
          Computed<List<Product>>(() => super.listProduct,
              name: '_CartControllerBase.listProduct'))
      .value;

  @override
  String toString() {
    return '''
listProductSelected: ${listProductSelected},
listProduct: ${listProduct}
    ''';
  }
}
