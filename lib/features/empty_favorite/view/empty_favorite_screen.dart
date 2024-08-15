import 'package:buduar/constants.dart';
import 'package:flutter/material.dart';

class EmptyFavoriteScreen extends StatelessWidget {
  const EmptyFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackgroudColor,
      appBar: AppBar(
        title: const Text("Улюблене"),
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
              "Ваш список порожній",
              textAlign: TextAlign.center,
              style: kModernGreyStyle25,
            ),
            const SizedBox(height: 5),
            const Text(
              "Спочатку додайте товари в улюблене",
              textAlign: TextAlign.center,
              style: kModernGreyStyle18,
            ),
          ],
        ),
      ),
    );
  }
}
