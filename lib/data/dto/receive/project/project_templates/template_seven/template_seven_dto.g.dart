// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_seven_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemplateSevenDto _$TemplateSevenDtoFromJson(Map<String, dynamic> json) =>
    TemplateSevenDto(
      id: json['id'] as int?,
      virtualTour: json['virtualTour'] == null
          ? null
          : TemplateSevenVirtualTourDto.fromJson(
              json['virtualTour'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TemplateSevenDtoToJson(TemplateSevenDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'virtualTour': instance.virtualTour,
    };

TemplateSevenVirtualTourDto _$TemplateSevenVirtualTourDtoFromJson(
        Map<String, dynamic> json) =>
    TemplateSevenVirtualTourDto(
      id: json['id'] as int?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$TemplateSevenVirtualTourDtoToJson(
        TemplateSevenVirtualTourDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
    };
