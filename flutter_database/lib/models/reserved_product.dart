class ReservedProduct {
  int reservedProductId;
  int reservationId;
  int productId;
  int quantity;

  ReservedProduct({
    required this.reservedProductId,
    required this.reservationId,
    required this.productId,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'reservedProductId': reservedProductId,
      'reservationId': reservationId,
      'productId': productId,
      'quantity': quantity,
    };
  }

  factory ReservedProduct.fromMap(Map<String, dynamic> map) {
    return ReservedProduct(
      reservedProductId: map['reservedProductId'],
      reservationId: map['reservationId'],
      productId: map['productId'],
      quantity: map['quantity'],
    );
  }
}
