import 'package:buduar/constants.dart';
import 'package:buduar/features/product/widgets/widgets.dart';
import 'package:buduar/models/product_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel product;
  const ProductScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final images = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg',
    'assets/5.jpg',
    'assets/6.jpg',
  ];

  int _currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackgroudColor,
      appBar: AppBar(
        title: const Text("Піжами"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            CarouselSlider.builder(
              itemCount: images.length,
              options: CarouselOptions(
                height: 500,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                onPageChanged: (int index, CarouselPageChangedReason reason) {
                  setState(() {
                    _currIndex = index;
                  });
                },
              ),
              itemBuilder: (BuildContext context, int index, int realIndex) {
                final assetImage = images[index];
                return Stack(
                  children: [
                    Center(
                        child: BigImageWidget(image: assetImage, index: index)),
                    ImageIndicatorWidget(
                      length: images.length,
                      currIndex: _currIndex,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      widget.product.title,
                      textAlign: TextAlign.start,
                      style: kProductTitleStyle,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    widget.product.price,
                    style: kProductPriceStyle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Розмір",
              style: kProductSubParamStyle,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizeWidget(size: "S"),
                SizeWidget(size: "M"),
                SizeWidget(size: "L"),
                SizeWidget(size: "XL"),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Колір",
              style: kProductSubParamStyle,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ColorWidget(color: Colors.white),
                ColorWidget(color: Colors.black),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Кількість",
              style: kProductSubParamStyle,
            ),
            const SizedBox(height: 4),
            const QuantityWidget(),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: kButtonDecorAddToCart,
              child: const Text(
                "Додати в корзину",
                style: kButtonStyleAddToCart,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          ],
        ),
      ),
    );
  }
}
