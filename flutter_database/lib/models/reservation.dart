class Reservation {
  int reservationId;
  DateTime date;
  int accountId;
  int voucherId;
  double totalPrice;

  Reservation({
    required this.reservationId,
    required this.date,
    required this.accountId,
    required this.voucherId,
    required this.totalPrice,
  });

  Map<String, dynamic> toMap() {
    return {
      'reservationId': reservationId,
      'date': date.toIso8601String(),
      'accountId': accountId,
      'voucherId': voucherId,
      'totalPrice': totalPrice,
    };
  }

  factory Reservation.fromMap(Map<String, dynamic> map) {
    return Reservation(
      reservationId: map['reservationId'],
      date: DateTime.parse(map['date']),
      accountId: map['accountId'],
      voucherId: map['voucherId'],
      totalPrice: map['totalPrice'],
    );
  }
}
