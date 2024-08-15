import 'package:buduar/buduar_app.dart';
import 'package:buduar/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CloseWindowWidget extends StatelessWidget {
  const CloseWindowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: const Icon(Icons.cancel_outlined),
          color: kDarkGreyColor,
          onPressed: () {
            FocusScope.of(context).unfocus();
            HapticFeedback.selectionClick();
            if (buduarNavigatorKey.currentState!.canPop()) {
              Get.back();
            } else {
              // buduarNavigatorKey.currentState!
              //     .pushNamedAndRemoveUntil('/bottomNavBar', (route) => false);
                  Get.offAllNamed('/bottomNavBar');
            }
          },
        ),
      ],
    );
  }
}
