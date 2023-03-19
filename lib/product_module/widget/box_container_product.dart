import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BoxContainerProduct extends StatelessWidget {
  BoxContainerProduct({
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
    return Container(
        padding: EdgeInsets.only(bottom: boxSize),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: child);
  }
}
