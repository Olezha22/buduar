import 'package:flutter/material.dart';

class SizeWidget extends StatelessWidget {
  final String size;
  const SizeWidget({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 50,
      margin: const EdgeInsets.all(4),
      color: const Color.fromARGB(255, 210, 182, 208),
      child: Center(
        child: Text(
          size,
          style: const TextStyle(
            fontFamily: "",
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}