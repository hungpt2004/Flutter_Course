class Favorite {
  int accountId;
  int productId;

  Favorite({
    required this.accountId,
    required this.productId,
  });

  Map<String, dynamic> toMap() {
    return {
      'accountId': accountId,
      'productId': productId,
    };
  }

  factory Favorite.fromMap(Map<String, dynamic> map) {
    return Favorite(
      accountId: map['accountId'],
      productId: map['productId'],
    );
  }
}
