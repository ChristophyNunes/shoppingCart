import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BoxContainerPayment extends StatelessWidget {
  BoxContainerPayment({
    Key? key,
    required this.child,
    required this.color,
    required this.boxSize,
  }) : super(key: key);
  final Widget child;
  final Color color;
  late double boxSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.all(boxSize),
            decoration: BoxDecoration(
              color: color,
            ),
            child: child),
        const SizedBox(height: 1),
      ],
    );
  }
}
