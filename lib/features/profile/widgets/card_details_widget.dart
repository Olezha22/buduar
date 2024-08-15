import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardDetailsWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  const CardDetailsWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  void _vibration() {
    HapticFeedback.selectionClick();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _vibration();
        onPressed();
      },
      child: Card(
        color: Colors.white,
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.black,
          ),
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
