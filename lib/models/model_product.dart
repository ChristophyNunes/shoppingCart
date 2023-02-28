class Product {
  String? image;
  String name = '';
  String? description;
  double price;
  int quantity;

  Product({
    this.image,
    required this.name,
    this.description,
    required this.price,
    required this.quantity,
  });
}
