import 'package:buduar/constants.dart';
import 'package:buduar/features/contact_us/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  void _onPressedPhone1() async {
    if (await canLaunchUrl(kphoneNumber1)) {
      await launchUrl(kphoneNumber1);
    }
  }

  void _onPressedPhone2() async {
    if (await canLaunchUrl(kphoneNumber2)) {
      await launchUrl(kphoneNumber2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackgroudColor,
      appBar: AppBar(
        title: const Text("Зв'яжіться з нами"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          PhoneNumberWidget(
            onPressed: _onPressedPhone1,
            phoneNumber: "+38 098-26-22-460",
          ),
          const SizedBox(height: 5),
          PhoneNumberWidget(
            onPressed: _onPressedPhone2,
            phoneNumber: "+38 095-57-31-070",
          ),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Divider(
              color: Colors.grey,
              height: 1,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "Режим роботи: 10:00 - 20:00",
            style: kBlackStyleDefFont16,
          ),
          const SizedBox(height: 5),
          const Text(
            "Без вихідних",
            style: kInputLabelStyle,
          ),
        ],
      ),
    );
  }
}

