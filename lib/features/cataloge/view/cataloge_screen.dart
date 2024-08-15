import 'package:buduar/features/cataloge/widgets/widgets.dart';
import 'package:buduar/features/product/product.dart';
import 'package:buduar/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:buduar/constants.dart';

class CatalogeScreen extends StatefulWidget {
  const CatalogeScreen({super.key});

  @override
  State<CatalogeScreen> createState() => _CatalogeScreenState();
}

class _CatalogeScreenState extends State<CatalogeScreen> {
  final TextEditingController _searchFieldController = TextEditingController();
  List<ProductModel> allProducts = productModels;

  @override
  void dispose() {
    _searchFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackgroudColor,
      appBar: AppBar(
        title: const Text("Каталог"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              child: SearchBarWidget(
                searchFieldController: _searchFieldController,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 16,
                ),
                Text(
                  "Категорії",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 90,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryItemWidget(
                    assetIcon: 'assets/underwear.png',
                    label: 'Білизна',
                  ),
                  CategoryItemWidget(
                    assetIcon: 'assets/swimsuit.png',
                    label: 'Купальники',
                  ),
                  CategoryItemWidget(
                    assetIcon: 'assets/pajamas.png',
                    label: 'Піжами',
                  ),
                  CategoryItemWidget(
                    assetIcon: 'assets/robe.png',
                    label: 'Халати',
                  ),
                  CategoryItemWidget(
                    assetIcon: 'assets/slippers.png',
                    label: 'Тапочки',
                  ),
                  CategoryItemWidget(
                    assetIcon: 'assets/socksIcon.png',
                    label: 'Шкарпетки',
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: CategoryItemWidget(
                      assetIcon: 'assets/other.png',
                      label: 'Інше',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 16),
                Text(
                  "Популярні товари",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 293,
                mainAxisSpacing: 10,
              ),
              itemCount: allProducts.length,
              itemBuilder: (context, index) {
                final product = allProducts[index];
                return PopularProductWidget(
                  image: product.assetImage,
                  price: product.price,
                  title: product.title,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductScreen(product: product),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}





