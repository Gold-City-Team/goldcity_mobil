// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_media_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GalleryMediaDto _$GalleryMediaDtoFromJson(Map<String, dynamic> json) =>
    GalleryMediaDto(
      id: json['id'] as int?,
      mediaItem: json['mediaItem'] == null
          ? null
          : MediaDto.fromJson(json['mediaItem'] as Map<String, dynamic>),
    )..category = json['category'] == null
        ? null
        : GalleryMediaCategoryDto.fromJson(
            json['category'] as Map<String, dynamic>);

Map<String, dynamic> _$GalleryMediaDtoToJson(GalleryMediaDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mediaItem': instance.mediaItem,
      'category': instance.category,
    };

GalleryMediaCategoryDto _$GalleryMediaCategoryDtoFromJson(
        Map<String, dynamic> json) =>
    GalleryMediaCategoryDto(
      id: json['id'] as int?,
      translation: json['translation'] == null
          ? null
          : GalleryMediaCategoryTranslationDto.fromJson(
              json['translation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GalleryMediaCategoryDtoToJson(
        GalleryMediaCategoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'translation': instance.translation,
    };

GalleryMediaCategoryTranslationDto _$GalleryMediaCategoryTranslationDtoFromJson(
        Map<String, dynamic> json) =>
    GalleryMediaCategoryTranslationDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$GalleryMediaCategoryTranslationDtoToJson(
        GalleryMediaCategoryTranslationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
