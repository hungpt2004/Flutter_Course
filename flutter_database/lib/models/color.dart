class Color {
  int colorId;
  String name;

  Color({
    required this.colorId,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'colorId': colorId,
      'name': name,
    };
  }

  factory Color.fromMap(Map<String, dynamic> map) {
    return Color(
      colorId: map['colorId'],
      name: map['name'],
    );
  }
}
