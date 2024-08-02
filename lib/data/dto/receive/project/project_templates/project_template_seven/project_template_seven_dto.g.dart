// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_template_seven_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectTemplateSevenDto _$ProjectTemplateSevenDtoFromJson(
        Map<String, dynamic> json) =>
    ProjectTemplateSevenDto(
      id: (json['id'] as num?)?.toInt(),
      virtualTour: json['virtualTour'] == null
          ? null
          : ProjectTemplateSevenVirtualTourDto.fromJson(
              json['virtualTour'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProjectTemplateSevenDtoToJson(
        ProjectTemplateSevenDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'virtualTour': instance.virtualTour,
    };

ProjectTemplateSevenVirtualTourDto _$ProjectTemplateSevenVirtualTourDtoFromJson(
        Map<String, dynamic> json) =>
    ProjectTemplateSevenVirtualTourDto(
      id: (json['id'] as num?)?.toInt(),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ProjectTemplateSevenVirtualTourDtoToJson(
        ProjectTemplateSevenVirtualTourDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
    };
