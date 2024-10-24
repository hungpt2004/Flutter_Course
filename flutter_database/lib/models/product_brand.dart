class Brand {
  int brandId;
  String name;
  int shopId;

  Brand({
    required this.brandId,
    required this.name,
    required this.shopId,
  });

  Map<String, dynamic> toMap() {
    return {
      'brandId': brandId,
      'name': name,
      'shopId': shopId,
    };
  }

  factory Brand.fromMap(Map<String, dynamic> map) {
    return Brand(
      brandId: map['brandId'],
      name: map['name'],
      shopId: map['shopId'],
    );
  }
}
