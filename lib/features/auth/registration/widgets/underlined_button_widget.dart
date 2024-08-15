import 'package:buduar/constants.dart';
import 'package:flutter/material.dart';

class UnderlinedButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const UnderlinedButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Text(
        text,
        style: kUnderlinedStyle,
      ),
    );
  }
}
