import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shoppingcar/payment_module/pages/controller/payment_controller.dart';
import 'package:shoppingcar/payment_module/pages/widget/box_container_payment.dart';
import 'widget/payment_card.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final PaymentController controller = Modular.get<PaymentController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'MEUS PEDIDOS',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 500,
            child: ListView.builder(
              itemCount: controller.listProductSelected.length,
              itemBuilder: (context, index) {
                return BoxContainerPayment(
                  color: Theme.of(context).secondaryHeaderColor,
                  boxSize: 10,
                  child: PaymentCard(
                    name: controller.listProductSelected[index].name,
                    priceItem: (controller.listProductSelected[index].price *
                            controller.listProductSelected[index].quantity)
                        .toStringAsFixed(2),
                    quantity: controller.listProductSelected[index].quantity
                        .toString(),
                    price: controller.listProductSelected[index].price
                        .toStringAsFixed(2),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  child: Text(
                    'Total:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                SizedBox(
                  child: Text(
                    'R\$ ${controller.total}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 40,
                  child: FloatingActionButton(
                    elevation: 10,
                    heroTag: 'produtos',
                    child: const Icon(
                      Icons.home,
                      size: 30,
                    ),
                    onPressed: () {
                      Modular.to.pushNamed('/home/');
                    },
                  ),
                ),
                const SizedBox(height: 5),
                const SizedBox(
                  child: Text('Produtos'),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 45),
                        child: const Text('Meu carrinho'),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        height: 40,
                        child: FloatingActionButton(
                          elevation: 10,
                          heroTag: 'meu carrinho',
                          child: const Icon(
                            Icons.shopping_cart,
                            size: 30,
                          ),
                          onPressed: () {
                            Modular.to.pushNamed('/home/cartPage');
                          },
                        ),
                      ),
                      Positioned(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50, bottom: 35),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 20,
                            ),
                            child: Text(
                              '${controller.listProductSelected.length}',
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
