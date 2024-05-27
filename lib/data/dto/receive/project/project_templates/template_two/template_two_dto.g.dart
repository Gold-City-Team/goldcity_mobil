// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_two_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemplateTwoDto _$TemplateTwoDtoFromJson(Map<String, dynamic> json) =>
    TemplateTwoDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      mediaItem: json['mediaItem'] == null
          ? null
          : MediaDto.fromJson(json['mediaItem'] as Map<String, dynamic>),
      galleries: (json['galleries'] as List<dynamic>?)
          ?.map(
              (e) => TemplateTwoGalleryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TemplateTwoDtoToJson(TemplateTwoDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'mediaItem': instance.mediaItem,
      'galleries': instance.galleries,
    };

TemplateTwoGalleryDto _$TemplateTwoGalleryDtoFromJson(
        Map<String, dynamic> json) =>
    TemplateTwoGalleryDto(
      id: json['id'] as int?,
      mediaItem: json['mediaItem'] == null
          ? null
          : MediaDto.fromJson(json['mediaItem'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TemplateTwoGalleryDtoToJson(
        TemplateTwoGalleryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mediaItem': instance.mediaItem,
    };
