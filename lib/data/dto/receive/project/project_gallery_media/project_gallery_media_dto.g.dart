// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_gallery_media_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectGalleryMediaDto _$ProjectGalleryMediaDtoFromJson(
        Map<String, dynamic> json) =>
    ProjectGalleryMediaDto(
      id: json['id'] as int?,
      mediaItem: json['mediaItem'] == null
          ? null
          : MediaDto.fromJson(json['mediaItem'] as Map<String, dynamic>),
      title: json['title'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ProjectGalleryMediaDtoToJson(
        ProjectGalleryMediaDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mediaItem': instance.mediaItem,
      'title': instance.title,
      'description': instance.description,
    };
