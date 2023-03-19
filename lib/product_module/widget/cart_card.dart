import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shoppingcar/product_module/controller/cart_controller.dart';
import 'package:shoppingcar/product_module/store/product_store.dart';
import 'package:shoppingcar/product_module/widget/box_container_cart.dart';

// ignore: must_be_immutable
class ProductCart extends StatelessWidget {
  final CartController controller = Modular.get<CartController>();

  final ProductStore product;
  int index;
  String quantity;

  Function()? onPressedAdd;
  Function()? onPressedRemove;

  ProductCart({
    super.key,
    required this.product,
    required this.quantity,
    this.onPressedAdd,
    this.onPressedRemove,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: Image.asset(
              product.image ?? '',
              fit: BoxFit.fill,
              height: 80,
              width: 80,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
              ),
              const SizedBox(height: 25),
              Text(
                'R\$ ${(controller.listProductSelected[index].price * controller.listProductSelected[index].quantity).toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
          const Spacer(),
          buildActionButtons(),
        ],
      ),
    );
  }

  buildActionButtons() {
    return Row(
      children: [
        SizedBox(
          height: 35,
          width: 35,
          child: IconButton(
            icon: const Icon(Icons.add),
            iconSize: 20,
            onPressed: onPressedAdd,
          ),
        ),
        SizedBox(
          width: 30,
          child: Center(
            child: Text(
              quantity,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 35,
          width: 35,
          child: IconButton(
            icon: const Icon(Icons.remove),
            iconSize: 20,
            onPressed: onPressedRemove,
          ),
        ),
      ],
    );
  }
}
