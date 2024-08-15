import 'package:buduar/constants.dart';
import 'package:buduar/features/our_social_media/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class OurSocialMediaScreen extends StatelessWidget {
  const OurSocialMediaScreen({super.key});

  void _onPressedViber() async {
    if (await canLaunchUrl(kUriViber)) {
      await launchUrl(kUriViber);
    }
  }

  void _onPressedInstagram() async {
    if (await canLaunchUrl(kUriInstagram)) {
      await launchUrl(kUriInstagram);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackgroudColor,
      appBar: AppBar(
        title: const Text("Наші соціальні мережі"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialMediaButtonWidget(
              icon: FontAwesomeIcons.viber,
              label: "Viber",
              buttonColor: kViberColor,
              onPressed: _onPressedViber,
            ),
            const SizedBox(height: 20),
            SocialMediaButtonWidget(
              icon: FontAwesomeIcons.instagram,
              label: "Instagram",
              buttonColor: kInstagramColor,
              onPressed: _onPressedInstagram,
            ),
          ],
        ),
      ),
    );
  }
}

