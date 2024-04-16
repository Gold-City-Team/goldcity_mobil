// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_gallery_media_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectGalleryMediaDto _$ProjectGalleryMediaDtoFromJson(
        Map<String, dynamic> json) =>
    ProjectGalleryMediaDto(
      id: json['id'] as int?,
      media: json['media'] == null
          ? null
          : MediaDto.fromJson(json['media'] as Map<String, dynamic>),
      title: json['title'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ProjectGalleryMediaDtoToJson(
        ProjectGalleryMediaDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'media': instance.media,
      'title': instance.title,
      'description': instance.description,
    };
