import 'package:buduar/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardShopWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const CardShopWidget({
    super.key,
    required this.title,
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
        color: kMainColor,
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(
              right: 12,
              top: 12,
              bottom: 12,
            ),
            child: Image.asset('assets/buduarOnly.png'),
          ),
          title: Text(title, style: kBlackStyleDefFont16),
          subtitle: const Text(
            'Час роботи: 10:00 - 20:00',
            style: kInputLabelStyle,
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
