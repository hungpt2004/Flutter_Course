class Voucher {
  int voucherId;
  String name;
  DateTime startDate;
  DateTime endDate;
  double discount;

  Voucher({
    required this.voucherId,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.discount,
  });

  Map<String, dynamic> toMap() {
    return {
      'voucherId': voucherId,
      'name': name,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'discount': discount,
    };
  }

  factory Voucher.fromMap(Map<String, dynamic> map) {
    return Voucher(
      voucherId: map['voucherId'],
      name: map['name'],
      startDate: DateTime.parse(map['startDate']),
      endDate: DateTime.parse(map['endDate']),
      discount: map['discount'],
    );
  }
}
