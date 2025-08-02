class ProductsModel {
  final String productName;
  bool hasSelected;
  int price;

  ProductsModel({
    required this.price,
    required this.productName,
    this.hasSelected = false,
  });
}
