import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  double priceProduct;
  String nameProduct;
  String? image;

  ProductCard({
    super.key,
    required this.nameProduct,
    required this.priceProduct,
    this.image = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Image.asset(
            image ?? 'assets/imgs/error-image.jpg',
            fit: BoxFit.fill,
            height: 120,
            width: 120,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          nameProduct,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        Text('R\$ ${priceProduct.toStringAsFixed(2)}'),
      ],
    );
  }
}
