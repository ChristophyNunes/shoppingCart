import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BoxContainerCart extends StatelessWidget {
  BoxContainerCart({
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
        padding: EdgeInsets.all(boxSize),
        decoration: BoxDecoration(
          color: color,
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 158, 154, 154), //New
                blurRadius: 3.0,
                offset: Offset(0, 5))
          ],
        ),
        child: child);
  }
}
