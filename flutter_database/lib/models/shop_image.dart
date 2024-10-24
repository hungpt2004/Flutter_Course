class ShopImage {
  int shopImageId;
  String urlImage;
  int shopId;

  ShopImage({
    required this.shopImageId,
    required this.urlImage,
    required this.shopId,
  });

  Map<String, dynamic> toMap() {
    return {
      'shopImageId': shopImageId,
      'urlImage': urlImage,
      'shopId': shopId,
    };
  }

  factory ShopImage.fromMap(Map<String, dynamic> map) {
    return ShopImage(
      shopImageId: map['shopImageId'],
      urlImage: map['urlImage'],
      shopId: map['shopId'],
    );
  }
}
