import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PaymentCard extends StatelessWidget {
  String name;
  String quantity;
  String priceItem;
  String price;

  PaymentCard(
      {super.key,
      required this.name,
      required this.quantity,
      required this.priceItem,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Text(
            quantity,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          const Text(
            ' X ',
            style: TextStyle(
                fontSize: 18, color: Color.fromARGB(255, 116, 114, 114)),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              Text(
                'R\$ $price',
                style: const TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 116, 114, 114)),
              ),
            ],
          ),
          const Spacer(),
          Text(
            'R\$ $priceItem',
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
