// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_gallery_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemplateGalleryDto _$TemplateGalleryDtoFromJson(Map<String, dynamic> json) =>
    TemplateGalleryDto(
      id: json['id'] as int?,
      mediaItem: json['mediaItem'] == null
          ? null
          : MediaDto.fromJson(json['mediaItem'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TemplateGalleryDtoToJson(TemplateGalleryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mediaItem': instance.mediaItem,
    };
