class ProductColor {
  int productId;
  int colorId;

  ProductColor({
    required this.productId,
    required this.colorId,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'colorId': colorId,
    };
  }

  factory ProductColor.fromMap(Map<String, dynamic> map) {
    return ProductColor(
      productId: map['productId'],
      colorId: map['colorId'],
    );
  }
}
