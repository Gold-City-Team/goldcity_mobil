class SendNewsCommentDto {
  final int? newsId;
  final String? content;
  final String? userName;

  SendNewsCommentDto({this.newsId, this.content, this.userName});
  Map<String, dynamic> toJson() {
    return {
      "newsId": newsId,
      "content": content,
      "userName": userName,
    };
  }
}
