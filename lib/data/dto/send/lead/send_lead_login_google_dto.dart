class SendLeadLoginGoogleDto {
  final String googleToken;

  SendLeadLoginGoogleDto({
    required this.googleToken,
  });
  Map<String, dynamic> toJson() {
    return {
      "googleToken": googleToken,
    };
  }
}
