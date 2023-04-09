// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterProductController on _RegisterProductControllerBase, Store {
  late final _$nameAtom =
      Atom(name: '_RegisterProductControllerBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$priceAtom =
      Atom(name: '_RegisterProductControllerBase.price', context: context);

  @override
  double get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(double value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  late final _$_RegisterProductControllerBaseActionController =
      ActionController(
          name: '_RegisterProductControllerBase', context: context);

  @override
  dynamic setName(String value) {
    final _$actionInfo = _$_RegisterProductControllerBaseActionController
        .startAction(name: '_RegisterProductControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_RegisterProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPrice(String value) {
    final _$actionInfo = _$_RegisterProductControllerBaseActionController
        .startAction(name: '_RegisterProductControllerBase.setPrice');
    try {
      return super.setPrice(value);
    } finally {
      _$_RegisterProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
price: ${price}
    ''';
  }
}
