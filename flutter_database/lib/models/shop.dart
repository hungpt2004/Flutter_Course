class Shop {
  int shopId;
  String name;
  String description;
  String phoneNumber;
  String address;
  String email;

  Shop({
    required this.shopId,
    required this.name,
    required this.description,
    required this.phoneNumber,
    required this.address,
    required this.email,
  });

  // Convert object to Map
  Map<String, dynamic> toMap() {
    return {
      'shopId': shopId,
      'name': name,
      'description': description,
      'phoneNumber': phoneNumber,
      'address': address,
      'email': email,
    };
  }

  // Create object from Map
  factory Shop.fromMap(Map<String, dynamic> map) {
    return Shop(
      shopId: map['shopId'],
      name: map['name'],
      description: map['description'],
      phoneNumber: map['phoneNumber'],
      address: map['address'],
      email: map['email'],
    );
  }
}
