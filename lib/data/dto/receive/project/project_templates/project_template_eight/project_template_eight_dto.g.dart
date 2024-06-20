// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_template_eight_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectTemplateEightDto _$ProjectTemplateEightDtoFromJson(
        Map<String, dynamic> json) =>
    ProjectTemplateEightDto(
      id: json['id'] as int?,
      titleDescriptionGalleries: (json['titleDescriptionGalleries']
              as List<dynamic>?)
          ?.map((e) =>
              TitleDescriptionGalleriesDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectTemplateEightDtoToJson(
        ProjectTemplateEightDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titleDescriptionGalleries': instance.titleDescriptionGalleries,
    };
