class ChangePasswordDto {
  String password;
  String newPassword;
  ChangePasswordDto({required this.password, required this.newPassword});
  Map<String, dynamic> toJson() {
    return {
      "password": password,
      "newPassword": newPassword,
    };
  }
}
