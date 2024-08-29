class CommentEntity {
  final String userName;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;
  CommentEntity({
    required this.userName,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });
}
