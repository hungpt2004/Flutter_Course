class Notification {
  int notificationId;
  String content;
  DateTime createdAt;
  int accountId;

  Notification({
    required this.notificationId,
    required this.content,
    required this.createdAt,
    required this.accountId,
  });

  Map<String, dynamic> toMap() {
    return {
      'notificationId': notificationId,
      'content': content,
      'createdAt': createdAt.toIso8601String(),
      'accountId': accountId,
    };
  }

  factory Notification.fromMap(Map<String, dynamic> map) {
    return Notification(
      notificationId: map['notificationId'],
      content: map['content'],
      createdAt: DateTime.parse(map['createdAt']),
      accountId: map['accountId'],
    );
  }
}
