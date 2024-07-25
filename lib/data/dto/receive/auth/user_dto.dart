import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  int? id;
  String? fullName;
  String? tel;
  String? email;
  String? userType;

  UserDto({this.id, this.fullName, this.tel, this.email, this.userType});
  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
