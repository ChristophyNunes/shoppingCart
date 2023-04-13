import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  double priceProduct;
  String nameProduct;
  String? image;
  String description;

  ProductCard({
    super.key,
    required this.nameProduct,
    required this.priceProduct,
    this.image = '',
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
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
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          description,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 5),
        Text('R\$ ${priceProduct.toStringAsFixed(2)}'),
      ],
    );
  }
}
