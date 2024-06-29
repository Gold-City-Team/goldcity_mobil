// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EducationDetailDto _$EducationDetailDtoFromJson(Map<String, dynamic> json) =>
    EducationDetailDto(
      json['id'] as int?,
      json['title'] as String?,
      json['description'] as String?,
      json['mediaItem'] == null
          ? null
          : MediaDto.fromJson(json['mediaItem'] as Map<String, dynamic>),
      json['scheduledStartDate'] == null
          ? null
          : DateTime.parse(json['scheduledStartDate'] as String),
    );

Map<String, dynamic> _$EducationDetailDtoToJson(EducationDetailDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'mediaItem': instance.mediaItem,
      'scheduledStartDate': instance.scheduledStartDate?.toIso8601String(),
    };
