import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shoppingcar/models/model_product.dart';
import 'package:shoppingcar/widget/box_container.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  final Product product;
  int index;
  String quantity;
  bool isCart;

  Function()? onPressedAdd;
  Function()? onPressedRemove;
  Function(BuildContext)? removeProduct;

  ProductCard({
    super.key,
    required this.product,
    required this.quantity,
    this.onPressedAdd,
    this.onPressedRemove,
    required this.index,
    this.isCart = true,
    this.removeProduct,
  });

  @override
  Widget build(BuildContext context) {
    return isCart ? isProduct() : isCartWidget();
  }

  Widget isCartWidget() {
    return Slidable(
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            backgroundColor: Colors.red,
            icon: Icons.delete,
            label: 'Deletar',
            onPressed: removeProduct,
          ),
        ],
      ),
      child: SizedBox(
        child: Row(
          children: [
            SizedBox(
              child: Image.asset(
                product.image ?? '',
                fit: BoxFit.fill,
                height: 100,
                width: 100,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 50,
                  left: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text('R\$ ${product.price.toStringAsFixed(2)}'),
                    Text(product.description ?? ''),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Observer(builder: (_) {
                  return Column(
                    children: [
                      const Text('Quantidade'),
                      Text(
                        quantity,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  );
                }),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget isProduct() {
    return SizedBox(
      child: Row(
        children: [
          SizedBox(
            child: Image.asset(
              product.image ?? '',
              fit: BoxFit.fill,
              height: 100,
              width: 100,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 50,
                left: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Text('R\$ ${product.price.toStringAsFixed(2)}'),
                  Text(product.description ?? ''),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Observer(builder: (_) {
                return Row(
                  children: [
                    BoxContainer(
                      color: const Color.fromARGB(255, 230, 233, 52),
                      boxSize: 0,
                      child: IconButton(
                        icon: const Icon(Icons.add),
                        iconSize: 20,
                        onPressed: onPressedAdd,
                      ),
                    ),
                    Text(
                      quantity,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    BoxContainer(
                      color: const Color.fromARGB(255, 230, 233, 52),
                      boxSize: 0,
                      child: IconButton(
                        icon: const Icon(Icons.remove),
                        iconSize: 20,
                        onPressed: onPressedRemove,
                      ),
                    )
                  ],
                );
              }),
            ],
          )
        ],
      ),
    );
  }
}
