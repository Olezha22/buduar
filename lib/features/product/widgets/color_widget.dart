import 'package:flutter/material.dart';

class ColorWidget extends StatelessWidget {
  final Color color;
  const ColorWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 50,
      margin: const EdgeInsets.all(4),
      color: color,
    );
  }
}