class Product {
  int productId;
  String name;
  String description;
  int shopId;

  Product({
    required this.productId,
    required this.name,
    required this.description,
    required this.shopId,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'name': name,
      'description': description,
      'shopId': shopId,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      productId: map['productId'],
      name: map['name'],
      description: map['description'],
      shopId: map['shopId'],
    );
  }
}
