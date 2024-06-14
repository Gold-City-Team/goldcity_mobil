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

TitleDescriptionGalleriesDto _$TitleDescriptionGalleriesDtoFromJson(
        Map<String, dynamic> json) =>
    TitleDescriptionGalleriesDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      galleries: (json['galleries'] as List<dynamic>?)
          ?.map((e) => GalleryMediaDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TitleDescriptionGalleriesDtoToJson(
        TitleDescriptionGalleriesDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'galleries': instance.galleries,
    };
