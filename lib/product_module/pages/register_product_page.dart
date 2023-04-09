import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shoppingcar/product_module/controller/register_product_controller.dart';
import 'package:shoppingcar/product_module/module/home_module.dart';
import 'package:shoppingcar/product_module/widget/box_container_product.dart';
import 'package:shoppingcar/product_module/widget/product_card.dart';

class RegisterProductPage extends StatefulWidget {
  const RegisterProductPage({super.key});

  @override
  State<RegisterProductPage> createState() => _RegisterProductPageState();
}

class _RegisterProductPageState extends State<RegisterProductPage> {
  final RegisterProductController controller =
      Modular.get<RegisterProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'CADASTRO DE PRODUTOS',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 10,
          ),
          child: cardRegisterProduct(),
        );
      }),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Modular.to.pushNamed(HomeModule.route);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).primaryColor,
                size: 35,
              ),
            ),
            SizedBox(
              height: 55,
              child: FloatingActionButton.extended(
                label: const Text(
                  'Cadastrar Produto',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  controller.addProductStore();
                  controller.disposeScreen();
                  Modular.to.pushNamed(HomeModule.route);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  cardRegisterProduct() {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 10, left: 10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {},
              child: BoxContainerProduct(
                boxSize: 10,
                color: Theme.of(context).secondaryHeaderColor,
                child: Observer(builder: (_) {
                  return ProductCard(
                    image: 'assets/imgs/error-image.jpg',
                    nameProduct: controller.name,
                    priceProduct: controller.price,
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              maxLength: 14,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  labelText: 'Nome do produto',
                  hintText: 'Ex: Celular'),
              onChanged: (value) {
                controller.setName(value);
              },
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: controller.textPrice,
              onChanged: (value) {
                controller.setPrice(value);
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                labelText: 'Preço',
              ),
            )
          ],
        ),
      ),
    );
  }
}
