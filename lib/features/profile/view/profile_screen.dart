import 'package:buduar/buduar_app.dart';
import 'package:buduar/constants.dart';
import 'package:buduar/features/profile/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _onPressedMyDetails() {
    buduarNavigatorKey.currentState!.pushNamed('/myDetails');
  }

  void _onPressedMyOrders() {
    buduarNavigatorKey.currentState!.pushNamed('/unAuthorized');
  }

  void _onPressedOurShops() {
    buduarNavigatorKey.currentState!.pushNamed('/ourShops');
  }

  void _onPressedOurSocialMedia() {
    buduarNavigatorKey.currentState!.pushNamed('/ourSocialMedia');
  }

  void _onPressedContactUs() {
    buduarNavigatorKey.currentState!.pushNamed('/contactUs');
  }

  void _onPressedMessages() {
    buduarNavigatorKey.currentState!.pushNamed('/pushMessages');
  }

  void _onPressedprivacyAndPolicies() {
    buduarNavigatorKey.currentState!.pushNamed('/privacyAndPolicies');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackgroudColor,
      appBar: AppBar(
        title: const Text("Профіль"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            CardDetailsWidget(
              title: "Мої дані",
              icon: Icons.account_circle,
              onPressed: _onPressedMyDetails,
            ),
            CardDetailsWidget(
              title: "Мої Замовлення",
              icon: Icons.receipt_long_rounded,
              onPressed: _onPressedMyOrders,
            ),
            const DividerWidget(),
            CardDetailsWidget(
              title: "Наші магазини",
              icon: Icons.storefront_sharp,
              onPressed: _onPressedOurShops,
            ),
            CardDetailsWidget(
              title: "Наші соціальні мережі",
              icon: Icons.phone_android_outlined,
              onPressed: _onPressedOurSocialMedia,
            ),
            const DividerWidget(),
            CardDetailsWidget(
              title: "Зв'яжіться з нами",
              icon: Icons.phone,
              onPressed: _onPressedContactUs,
            ),
            CardDetailsWidget(
              title: "Сповіщення",
              icon: Icons.message_outlined,
              onPressed: _onPressedMessages,
            ),
            CardDetailsWidget(
              title: "Політика та конфіденційність",
              icon: Icons.privacy_tip_outlined,
              onPressed: _onPressedprivacyAndPolicies,
            ),
          ],
        ),
      ),
    );
  }
}
