import 'package:buduar/constants.dart';
import 'package:flutter/material.dart';

class ButtonSaveChangesWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const ButtonSaveChangesWidget({
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
        'Зберегти зміни',
        style: kBlackTextStyle,
      ),
    );
  }
}
