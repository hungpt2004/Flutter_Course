class Feedback {
  int feedbackId;
  String content;
  DateTime createdAt;
  int accountId;

  Feedback({
    required this.feedbackId,
    required this.content,
    required this.createdAt,
    required this.accountId,
  });

  Map<String, dynamic> toMap() {
    return {
      'feedbackId': feedbackId,
      'content': content,
      'createdAt': createdAt.toIso8601String(),
      'accountId': accountId,
    };
  }

  factory Feedback.fromMap(Map<String, dynamic> map) {
    return Feedback(
      feedbackId: map['feedbackId'],
      content: map['content'],
      createdAt: DateTime.parse(map['createdAt']),
      accountId: map['accountId'],
    );
  }
}
