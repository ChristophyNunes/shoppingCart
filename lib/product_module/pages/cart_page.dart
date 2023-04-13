import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shoppingcar/product_module/controller/cart_controller.dart';
import 'package:shoppingcar/product_module/module/home_module.dart';
import 'package:shoppingcar/product_module/module/payment_module.dart';
import 'package:shoppingcar/product_module/widget/box_container_cart.dart';
import 'package:shoppingcar/product_module/widget/cart_card.dart';

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
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'MEU CARRINHO',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                showAlertDialogRemoveAll();
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
      body: Observer(
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: ListView.builder(
              itemCount: controller.listProductSelected.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(height: 10),
                    Slidable(
                      endActionPane: ActionPane(
                        extentRatio: 0.25,
                        motion: const DrawerMotion(),
                        children: [
                          SlidableAction(
                            backgroundColor: Colors.red,
                            icon: Icons.delete,
                            onPressed: (BuildContext context) {
                              controller.deleteAndSetQuantityZero(
                                  controller.listProductSelected[index], index);
                              if (controller.listProductSelected.isEmpty) {
                                Modular.to.pushNamed(HomeModule.route);
                              }
                            },
                          ),
                        ],
                      ),
                      child: BoxContainerCart(
                        color: Theme.of(context).secondaryHeaderColor,
                        boxSize: 5,
                        child: Observer(builder: (_) {
                          return ProductCart(
                            product: controller.listProductSelected[index],
                            onPressedAdd: () {
                              controller.incrementQuantity(index);
                            },
                            onPressedRemove: () {
                              controller.listProductSelected[index].quantity > 1
                                  ? controller.decrementQuantity(index)
                                  : controller.deleteAndSetQuantityZero(
                                      controller.listProductSelected[index],
                                      index);
                              if (controller.listProductSelected.isEmpty) {
                                Modular.to.pop();
                              }
                            },
                            index: index,
                            quantity: controller
                                .listProductSelected[index].quantity
                                .toString(),
                          );
                        }),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Modular.to.pushNamed(HomeModule.route);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.blue,
                size: 35,
              ),
            ),
            SizedBox(
              height: 55,
              child: FloatingActionButton.extended(
                icon: const Text(
                  'Pagar',
                  style: TextStyle(fontSize: 18),
                ),
                label: Observer(builder: (_) {
                  return Text(
                    'R\$ ${controller.total}',
                    style: const TextStyle(fontSize: 18),
                  );
                }),
                onPressed: () {
                  Modular.to.pushNamed(PaymentModule.route);
                },
              ),
            ),
          ],
        ),
      ],
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
        Navigator.of(context).pop();
        Modular.to.pop();
      },
      label: const Text('Remover'),
    );
    AlertDialog alerta = AlertDialog(
      title: const Text('Descartar carrinho'),
      content: const Text('Deseja remover todos os produtos do carrinho?'),
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
