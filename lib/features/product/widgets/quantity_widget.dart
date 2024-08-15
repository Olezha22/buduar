
import 'package:flutter/material.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.remove_circle_outline_sharp,
          size: 32,
          color: Colors.grey[700],
        ),
        const Text(
          ' 1 ',
          style: TextStyle(
            fontSize: 30,
            fontFamily: "",
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(
          Icons.add_circle_outline_sharp,
          size: 32,
          color: Colors.grey[700],
        ),
      ],
    );
  }
}
