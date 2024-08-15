import 'package:buduar/constants.dart';
import 'package:buduar/features/our_shops/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OurShopsScreen extends StatelessWidget {
  const OurShopsScreen({super.key});

  void _onPressedShop1() async {
    if (await canLaunchUrl(uriShop1)) {
      await launchUrl(uriShop1);
    }
  }

  void _onPressedShop2() async {
    if (await canLaunchUrl(uriShop2)) {
      await launchUrl(uriShop2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackgroudColor,
      appBar: AppBar(
        title: const Text("Наші магазини"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CardShopWidget(
              title: 'Трускавець, бульвар Юрія Дрогобича 3',
              onPressed: _onPressedShop1,
            ),
            const SizedBox(height: 10),
            CardShopWidget(
              title: 'Трускавець, вул. Тараса Шевченка 14',
              onPressed: _onPressedShop2,
            ),
          ],
        ),
      ),
    );
  }
}
