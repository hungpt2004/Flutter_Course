class NotificationAccount {
  int notificationId; // ID của thông báo
  int accountId; // ID của tài khoản liên kết với thông báo
  String status; // Trạng thái của thông báo (chẳng hạn như "đã đọc" hoặc "chưa đọc")

  NotificationAccount({
    required this.notificationId,
    required this.accountId,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'notificationId': notificationId,
      'accountId': accountId,
      'status': status,
    };
  }

  factory NotificationAccount.fromMap(Map<String, dynamic> map) {
    return NotificationAccount(
      notificationId: map['notificationId'],
      accountId: map['accountId'],
      status: map['status'],
    );
  }
}
