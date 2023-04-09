import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shoppingcar/product_module/controller/product_controller.dart';
import 'package:shoppingcar/product_module/module/payment_module.dart';
import 'package:shoppingcar/product_module/widget/box_container_product.dart';
import 'package:shoppingcar/product_module/widget/product_card.dart';

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
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'PRODUTOS',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.blue),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                controller.removeAllProductSelected();
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: navDrawer(),
      ),
      body: Center(
        child: GridView.count(
          childAspectRatio: 0.7,
          shrinkWrap: true,
          crossAxisCount: 3,
          children: List.generate(
              controller.listProduct.length, (index) => cardProduct(index)),
        ),
      ),
      persistentFooterButtons: footerButtons(),
    );
  }

  showAlertDialog(String text) {
    Widget okButton = FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text('Ok'),
    );
    AlertDialog alerta = AlertDialog(
      title: const Text('Ooooops!'),
      content: Text(text),
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

  cardProduct(int index) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Observer(
          builder: (_) {
            return InkWell(
              onTap: () {
                if (controller.listProduct[index].quantity == 0) {
                  controller.addProductSelected(controller.listProduct[index]);
                }
                controller.incrementQuantity(index);
              },
              child: Stack(
                children: [
                  BoxContainerProduct(
                    boxSize: 10,
                    color: Theme.of(context).secondaryHeaderColor,
                    child: ProductCard(
                      image: controller.listProduct[index].image,
                      nameProduct: controller.listProduct[index].name,
                      priceProduct: controller.listProduct[index].price,
                    ),
                  ),
                  Visibility(
                    visible: controller.listProduct[index].quantity > 0,
                    child: Stack(
                      children: [
                        Container(
                          height: 168,
                          width: 122,
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.5),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            top: 50,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.9),
                              shape: BoxShape.circle,
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 90,
                            ),
                            child: Text(
                              '${controller.listProduct[index].quantity}',
                              style: const TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  navDrawer() {
    return ListView(
      children: [
        const SizedBox(height: 1),
        ListTile(
          leading: const Icon(
            Icons.person_outline,
            size: 40,
          ),
          title: const Text('Meus dados'),
          tileColor: Theme.of(context).secondaryHeaderColor,
          onTap: () {},
        ),
        const SizedBox(height: 2),
        ListTile(
          leading: const Icon(
            Icons.post_add_sharp,
            size: 40,
          ),
          title: const Text('Cadastro de produtos'),
          tileColor: Theme.of(context).secondaryHeaderColor,
          onTap: () {
            Modular.to.pushNamed('/home/registerProductPage');
          },
        ),
      ],
    );
  }

  footerButtons() {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            children: [
              FloatingActionButton(
                elevation: 10,
                heroTag: 'shopping cart',
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 40,
                ),
                onPressed: () {
                  controller.listProductSelected.isEmpty
                      ? showAlertDialog(
                          'Selecione ao menos um produto para acessar o carrinho!!!')
                      : Modular.to.pushNamed('/home/cartPage');
                },
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, bottom: 35),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 20,
                    ),
                    child: Observer(
                      builder: (_) {
                        return Text(
                          '${controller.listProductSelected.length}',
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 55,
            child: FloatingActionButton.extended(
              elevation: 10,
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
                controller.listProductSelected.isEmpty
                    ? showAlertDialog(
                        'Selecione ao menos um produto para acessar a tela de pagamentos!!!')
                    : Modular.to.pushNamed(PaymentModule.route);
              },
            ),
          ),
        ],
      ),
    ];
  }
}
