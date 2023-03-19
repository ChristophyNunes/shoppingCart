import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shoppingcar/product_module/controller/cart_controller.dart';
import 'package:shoppingcar/product_module/store/product_store.dart';

// ignore: must_be_immutable
class Product extends StatelessWidget {
  final CartController controller = Modular.get<CartController>();

  final ProductStore product;
  int index;

  Product({
    super.key,
    required this.product,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Image.asset(
            product.image ?? '',
            fit: BoxFit.cover,
            height: 120,
            width: 120,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          product.name,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        Text('R\$ ${product.price.toStringAsFixed(2)}'),
      ],
    );
  }
}
