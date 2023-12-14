
class TeaCommentsModel {
  final int userId;
  final String userName;
  final String comment;

  TeaCommentsModel({
    required this.userId,
    required this.userName,
    required this.comment,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'userName': userName,
      'comment': comment,
    };
  }

  factory TeaCommentsModel.fromMap(Map<String, dynamic> map) {
    return TeaCommentsModel(
      userId: map['user_id'] as int,
      userName: map['username'] as String,
      comment: map['comment'] as String,
    );
  }
}
