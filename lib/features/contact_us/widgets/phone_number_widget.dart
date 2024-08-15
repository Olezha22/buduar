import 'package:buduar/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PhoneNumberWidget extends StatelessWidget {
  final String phoneNumber;
  final VoidCallback onPressed;
  const PhoneNumberWidget({
    super.key,
    required this.phoneNumber,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: Colors.white,
        child: ListTile(
          leading: const Icon(
            FontAwesomeIcons.phone,
            color: Colors.black,
          ),
          title: Text(
            phoneNumber,
            style: kBlackStyleDefFont16,
          ),
        ),
      ),
    );
  }
}
