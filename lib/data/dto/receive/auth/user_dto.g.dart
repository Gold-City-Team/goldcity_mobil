// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      id: (json['id'] as num?)?.toInt(),
      fullName: json['fullName'] as String?,
      tel: json['tel'] as String?,
      email: json['email'] as String?,
      userType: json['userType'] as String?,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'tel': instance.tel,
      'email': instance.email,
      'userType': instance.userType,
    };
