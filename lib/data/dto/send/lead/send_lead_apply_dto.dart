class SendLeadApplyDto {
  final String campaignName;
  final String language;
  final String dataSource;
  final String email;
  final String fullName;
  final String tel;

  SendLeadApplyDto({
    required this.campaignName,
    required this.language,
    required this.dataSource,
    required this.email,
    required this.fullName,
    required this.tel,
  });
  Map<String, dynamic> toJson() {
    return {
      campaignName: "campaignName",
      language: "language",
      dataSource: "dataSource",
      email: "email",
      fullName: "fullName",
      tel: "tel",
    };
  }
}
