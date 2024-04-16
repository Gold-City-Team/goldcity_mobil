// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_gallery_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectGalleryDto _$ProjectGalleryDtoFromJson(Map<String, dynamic> json) =>
    ProjectGalleryDto(
      id: json['id'] as int?,
      projectGallery: (json['projectGalleries'] as List<dynamic>?)
          ?.map(
              (e) => ProjectGalleryMediaDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectGalleryDtoToJson(ProjectGalleryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectGalleries': instance.projectGallery,
    };
