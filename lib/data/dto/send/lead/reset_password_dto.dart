class ResetPasswordDto {
  String? email;

  ResetPasswordDto({
    required this.email,
  });
  Map<String, dynamic> toJson() {
    return {
      "email": email,
    };
  }
}
