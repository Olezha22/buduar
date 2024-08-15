import 'package:buduar/constants.dart';
import 'package:flutter/material.dart';

class ButtonLogInWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const ButtonLogInWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: kLogInUpButtonColor,
      ),
      onPressed: () {
        onPressed();
      },
      child: const Text(
        'Увійти',
        style: kBlackTextStyle,
      ),
    );
  }
}
