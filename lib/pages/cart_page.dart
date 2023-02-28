import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shoppingcar/controller/cart_controller.dart';
import 'package:shoppingcar/widget/box_container.dart';
import 'package:shoppingcar/widget/product_card.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartController controller = Modular.get<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shopping Car'),
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          onPressed: () {
            Modular.to.navigate('/');
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                showAlertDialogRemoveAll();
              },
              icon: const Icon(Icons.delete_forever_outlined),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: controller.listProductSelected.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(height: 10),
              BoxContainer(
                color: const Color(0xffbadb73),
                boxSize: 10,
                child: ProductCard(
                  removeProduct: (product) {
                    setState(() {});
                    controller.deleteAndSetQuantityZero(
                        controller.listProductSelected[index], index);
                  },
                  isCart: false,
                  product: controller.listProductSelected[index],
                  index: index,
                  quantity:
                      controller.listProductSelected[index].quantity.toString(),
                ),
              ),
              const SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }

  showAlertDialogRemoveAll() {
    Widget cancel = FloatingActionButton.extended(
      onPressed: () {
        Navigator.of(context).pop();
      },
      label: const Text('Cancelar'),
    );
    Widget removeAll = FloatingActionButton.extended(
      onPressed: () {
        controller.removeAllProductSelected();
        Modular.to.navigate('/');
      },
      label: const Text('Remover'),
    );
    AlertDialog alerta = AlertDialog(
      title: const Text('Descartar carrinho'),
      content: const Text('Deseja descartar todos os produtos do carrinho?'),
      actions: [
        cancel,
        removeAll,
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





// floatingActionButton: SizedBox(
//         height: 70,
//         width: 70,
//         child: FittedBox(
//           child: FloatingActionButton(
//             onPressed: () {},
//             tooltip: 'Go to Payment',
//             backgroundColor: Theme.of(context).primaryColor,
//             child: const Icon(
//               Icons.credit_card,
//               size: 40,
//             ),
//           ),
//         ),
//       ),


//  body: Center(
//         child: SizedBox(
//           child: ListView.builder(
//             itemCount: controller.listProduct.length,
//             itemBuilder: (context, index) {
//               return Column(
//                 children: [
//                   const SizedBox(height: 10),
//                   BoxContainer(
//                     color: const Color(0xffbadb73),
//                     boxSize: 10,
//                     child: const AlertDialog(),
//                   ),
//                   const SizedBox(height: 10),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),