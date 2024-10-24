class Size {
  int sizeId;
  String size;

  Size({
    required this.sizeId,
    required this.size,
  });

  Map<String, dynamic> toMap() {
    return {
      'sizeId': sizeId,
      'size': size,
    };
  }

  factory Size.fromMap(Map<String, dynamic> map) {
    return Size(
      sizeId: map['sizeId'],
      size: map['size'],
    );
  }
}
