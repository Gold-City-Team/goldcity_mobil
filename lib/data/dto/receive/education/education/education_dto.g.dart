// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EducationDto _$EducationDtoFromJson(Map<String, dynamic> json) => EducationDto(
      id: json['id'] as int?,
      educationDetail: json['educationDetail'] == null
          ? null
          : EducationDetailDto.fromJson(
              json['educationDetail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EducationDtoToJson(EducationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'educationDetail': instance.educationDetail,
    };
