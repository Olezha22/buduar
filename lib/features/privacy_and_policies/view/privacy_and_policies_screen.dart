import 'package:buduar/constants.dart';
import 'package:flutter/material.dart';

class PrivacyAndPoliciesScreen extends StatelessWidget {
  const PrivacyAndPoliciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackgroudColor,
      appBar: AppBar(
        title: const Text(
          "Політика та конфіденційність",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
