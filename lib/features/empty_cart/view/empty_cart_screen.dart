import 'package:buduar/constants.dart';
import 'package:flutter/material.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackgroudColor,
      appBar: AppBar(
        title: const Text("Корзина"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/buduar-Photoroom.png',
              color: kMainColor,
            ),
            const SizedBox(height: 50),
            const Text(
              "Ваша корзина порожня",
              textAlign: TextAlign.center,
              style: kModernGreyStyle25,
            ),
            const SizedBox(height: 5),
            const Text(
              "Спочатку додайте товари до корзини",
              textAlign: TextAlign.center,
              style: kModernGreyStyle18,
            ),
          ],
        ),
      ),
    );
  }
}
