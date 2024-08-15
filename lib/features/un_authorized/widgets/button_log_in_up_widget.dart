import 'package:buduar/constants.dart';
import 'package:flutter/material.dart';

class ButtonLogInUpWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const ButtonLogInUpWidget({
    super.key,
    required this.onPressed, required this.text,
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
      child:  Text(
        text,
        style: kBlackTextStyle,
      ),
    );
  }
}
