import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shoppingcar/controller/product_controller.dart';
import 'package:shoppingcar/widget/box_container.dart';
import 'package:shoppingcar/widget/product_card.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProductController controller = Modular.get<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: ListView.builder(
            itemCount: controller.listProduct.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const SizedBox(height: 10),
                  BoxContainer(
                    color: const Color(0xffbadb73),
                    boxSize: 10,
                    child: ProductCard(
                      product: controller.listProduct[index],
                      onPressedAdd: () {
                        if (controller.listProduct[index].quantity == 0) {
                          controller.addProductSelected(
                              controller.listProduct[index]);
                        }
                        controller.incrementQuantity(index);
                        setState(() {});
                      },
                      onPressedRemove: () {
                        if (controller.listProduct[index].quantity == 1) {
                          controller.removeProductSelected(
                              controller.listProduct[index]);
                        }
                        controller.decrementQuantity(index);

                        setState(() {});
                      },
                      index: index,
                      quantity:
                          controller.listProduct[index].quantity.toString(),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              );
            },
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Shopping Chris'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          Container(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Observer(builder: (_) {
                  return Container(
                    alignment: Alignment.bottomLeft,
                    child: Text('${controller.listProductSelected.length}'),
                  );
                }),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: () {
                      controller.listProductSelected.isEmpty
                          ? showAlertDialog()
                          : Modular.to.navigate('/cartPage');
                    },
                    tooltip: 'Show Shopping Cart',
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  showAlertDialog() {
    Widget okButton = FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text('Ok'),
    );
    AlertDialog alerta = AlertDialog(
      title: const Text('Ooooops!'),
      content:
          const Text('Selecione ao menos um produto para acessar o carrinho'),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }
}
