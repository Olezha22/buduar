import 'package:buduar/constants.dart';
import 'package:flutter/material.dart';

class ButtonResetPasswordWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const ButtonResetPasswordWidget({
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
        'Скинути Пароль',
        style: kBlackTextStyle,
      ),
    );
  }
}