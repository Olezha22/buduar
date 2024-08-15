import 'package:flutter/material.dart';

class SocialMediaButtonWidget extends StatelessWidget {
  final String label;
  final Color buttonColor;
  final VoidCallback onPressed;
  final IconData icon;
  const SocialMediaButtonWidget({
    super.key,
    required this.label,
    required this.buttonColor,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(icon),
      label: Text(
        label,
        style: const TextStyle(
          fontFamily: "",
          letterSpacing: 1.5,
        ),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(230, 50),
        backgroundColor: buttonColor,
        foregroundColor: Colors.white,
      ),
    );
  }
}
