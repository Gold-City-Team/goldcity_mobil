// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectDetailDto _$ProjectDetailDtoFromJson(Map<String, dynamic> json) =>
    ProjectDetailDto(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      slogan: json['slogan'] as String?,
      templates: (json['templates'] as List<dynamic>?)
          ?.map((e) => MainTemplateDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectDetailDtoToJson(ProjectDetailDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slogan': instance.slogan,
      'templates': instance.templates,
    };
