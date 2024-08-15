import 'package:buduar/buduar_app.dart';
import 'package:buduar/constants.dart';
import 'package:buduar/features/shopping_cart/widgets/widgets.dart';
import 'package:buduar/models/product_model.dart';
import 'package:flutter/material.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  final List<ProductModel> allProducts = productModels;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackgroudColor,
      appBar: AppBar(
        title: const Text("Корзина"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: allProducts.length +
                  1, // Збільшуємо кількість елементів на один для кнопки
              itemBuilder: (context, index) {
                if (index < allProducts.length) {
                  final product = allProducts[index];
                  // Умова для звичайних товарів
                  return ListViewItemWidget(
                    amount: product.price,
                    description: product.title,
                    onPressedClose: () {},
                    image: product.assetImage,
                  );
                } else {
                  return ButtonCompleteOrderWidget(
                    onPressed: () {
                      buduarNavigatorKey.currentState!
                          .pushNamed('/completeOrder');
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
