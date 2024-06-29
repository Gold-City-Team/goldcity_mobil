// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EducationDetailDto _$EducationDetailDtoFromJson(Map<String, dynamic> json) =>
    EducationDetailDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      mediaItem: json['mediaItem'] == null
          ? null
          : MediaDto.fromJson(json['mediaItem'] as Map<String, dynamic>),
      scheduledStartDate: json['scheduledStartDate'] == null
          ? null
          : DateTime.parse(json['scheduledStartDate'] as String),
      isRegister: json['isRegister'] as bool?,
    );

Map<String, dynamic> _$EducationDetailDtoToJson(EducationDetailDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'mediaItem': instance.mediaItem,
      'scheduledStartDate': instance.scheduledStartDate?.toIso8601String(),
      'isRegister': instance.isRegister,
    };
