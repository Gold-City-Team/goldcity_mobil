class SendNotificationTokenDto {
  String? deviceToken;
  String? deviceType;
  String? deviceLanguage;
  SendNotificationTokenDto(
      {this.deviceLanguage, this.deviceToken, this.deviceType});
  Map<String, dynamic> toJson() {
    return {
      "deviceToken": deviceToken,
      "deviceType": deviceType,
      "deviceLanguage": deviceLanguage,
    };
  }
}
