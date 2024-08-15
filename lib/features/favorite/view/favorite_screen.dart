import 'package:buduar/constants.dart';
import 'package:buduar/features/favorite/widgets/widgets.dart';
import 'package:buduar/models/product_model.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});
  final List<ProductModel> allProducts = productModels;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackgroudColor,
      appBar: AppBar(
        title: const Text("Улюблене"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: allProducts.length,
              itemBuilder: (context, index) {
                final product = allProducts[index];
                return ListViewItemWidget(
                  amount: product.price,
                  description: product.title,
                  onPressedClose: () {},
                  image: product.assetImage,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
