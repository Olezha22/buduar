import 'package:buduar/constants.dart';
import 'package:flutter/material.dart';

class ButtonChangePasswordWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const ButtonChangePasswordWidget({
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
        'Змінити пароль',
        style: kBlackTextStyle,
      ),
    );
  }
}