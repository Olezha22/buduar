class ProductModel {
  final String title;
  final String price;
  final String assetImage;

  const ProductModel({
    required this.assetImage,
    required this.title,
    required this.price,
  });
}

const productModels = [
  ProductModel(
    assetImage: 'assets/1.jpg',
    title: "Жіноча піжама Sonia",
    price: "1990 грн",
  ),
  ProductModel(
    assetImage: 'assets/2.jpg',
    title: "Піжама Paula з мотивом Love",
    price: "2680 грн",
  ),
  ProductModel(
    assetImage: 'assets/3.jpg',
    title: "Піжама Emilia з принтом <Love>",
    price: "2850 грн",
  ),
  ProductModel(
    assetImage: 'assets/4.jpg',
    title: "Сорочка Emilia",
    price: "2550 грн",
  ),
  ProductModel(
    assetImage: 'assets/5.jpg',
    title: "Піжама Mellissa",
    price: "1400 грн",
  ),
  ProductModel(
    assetImage: 'assets/6.jpg',
    title: "Піжама Love is All",
    price: "1450 грн",
  ),
];
