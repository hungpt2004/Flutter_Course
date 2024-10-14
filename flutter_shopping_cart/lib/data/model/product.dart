class Product {
  final String id;
  final String name;
  final double price;
  int quantity;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
    this.isFavorite = false
  });
}
