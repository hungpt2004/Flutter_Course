class Account {
  int accountId;
  String email;
  String password;
  String cmnd;
  String name;
  String gender;
  DateTime dateOfBirth;
  String phoneNumber;
  String avatarUrl;
  String address;
  int role;
  int status;

  Account({
    required this.accountId,
    required this.email,
    required this.password,
    required this.cmnd,
    required this.name,
    required this.gender,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.avatarUrl,
    required this.address,
    required this.role,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'accountId': accountId,
      'email': email,
      'password': password,
      'cmnd': cmnd,
      'name': name,
      'gender': gender,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'phoneNumber': phoneNumber,
      'avatarUrl': avatarUrl,
      'address': address,
      'role': role,
      'status': status,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      accountId: map['accountId'],
      email: map['email'],
      password: map['password'],
      cmnd: map['cmnd'],
      name: map['name'],
      gender: map['gender'],
      dateOfBirth: DateTime.parse(map['dateOfBirth']),
      phoneNumber: map['phoneNumber'],
      avatarUrl: map['avatarUrl'],
      address: map['address'],
      role: map['role'],
      status: map['status'],
    );
  }
}
