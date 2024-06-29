class SendEducationApplyDto {
  final int? meetingId;

  SendEducationApplyDto({this.meetingId});
  Map<String, dynamic> toJson() {
    return {
      "meetingId": meetingId,
    };
  }
}
