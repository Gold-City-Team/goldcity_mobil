// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_education_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEducationDto _$UserEducationDtoFromJson(Map<String, dynamic> json) =>
    UserEducationDto(
      json['id'] as int?,
      json['meeting'] == null
          ? null
          : EducationDetailDto.fromJson(
              json['meeting'] as Map<String, dynamic>),
      json['joinUrl'] as String?,
    );

Map<String, dynamic> _$UserEducationDtoToJson(UserEducationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meeting': instance.meeting,
      'joinUrl': instance.joinUrl,
    };
