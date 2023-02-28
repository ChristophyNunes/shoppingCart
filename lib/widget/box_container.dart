import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BoxContainer extends StatelessWidget {
  BoxContainer({
    Key? key,
    required this.child,
    required this.color,
    required this.boxSize,
  }) : super(key: key);
  final Widget child;
  final Color color;
  late double boxSize = 10;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
          padding: EdgeInsets.all(boxSize),
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: child),
    );
  }
}
