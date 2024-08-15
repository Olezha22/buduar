import 'package:buduar/constants.dart';
import 'package:flutter/material.dart';

class ButtonCompleteOrderWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const ButtonCompleteOrderWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: kCompleteOrderBackColor,
          foregroundColor: kCompleteOrderForeColor,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        ),
        child: const Text(
          'Замовити',
          style: TextStyle(
            fontFamily: "",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
