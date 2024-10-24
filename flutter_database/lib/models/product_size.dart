class ProductSize {
  int productSizeId;
  double price;
  int amount;
  int sizeId;
  int productColorId;

  ProductSize({
    required this.productSizeId,
    required this.price,
    required this.amount,
    required this.sizeId,
    required this.productColorId,
  });

  Map<String, dynamic> toMap() {
    return {
      'productSizeId': productSizeId,
      'price': price,
      'amount': amount,
      'sizeId': sizeId,
      'productColorId': productColorId,
    };
  }

  factory ProductSize.fromMap(Map<String, dynamic> map) {
    return ProductSize(
      productSizeId: map['productSizeId'],
      price: map['price'],
      amount: map['amount'],
      sizeId: map['sizeId'],
      productColorId: map['productColorId'],
    );
  }
}
