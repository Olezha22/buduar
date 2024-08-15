import 'package:buduar/constants.dart';
import 'package:flutter/material.dart';

class ButtonRegistrationWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  const ButtonRegistrationWidget({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 163,
      height: 40,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: kLogInUpButtonColor,
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
