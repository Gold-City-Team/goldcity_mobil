// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_gallery_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectGalleryDto _$ProjectGalleryDtoFromJson(Map<String, dynamic> json) =>
    ProjectGalleryDto(
      id: json['id'] as int?,
      gallery: json['gallery'] == null
          ? null
          : GalleryDto.fromJson(json['gallery'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProjectGalleryDtoToJson(ProjectGalleryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'gallery': instance.gallery,
    };

GalleryDto _$GalleryDtoFromJson(Map<String, dynamic> json) => GalleryDto(
      id: json['id'] as int?,
      projectGallery: (json['medias'] as List<dynamic>?)
          ?.map(
              (e) => ProjectGalleryMediaDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GalleryDtoToJson(GalleryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'medias': instance.projectGallery,
    };
