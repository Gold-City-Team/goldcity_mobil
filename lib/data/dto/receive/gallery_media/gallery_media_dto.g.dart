// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_media_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GalleryMediaDto _$GalleryMediaDtoFromJson(Map<String, dynamic> json) =>
    GalleryMediaDto(
      id: (json['id'] as num?)?.toInt(),
      mediaItem: json['mediaItem'] == null
          ? null
          : MediaDto.fromJson(json['mediaItem'] as Map<String, dynamic>),
      title: json['title'] as String?,
      description: json['description'] as String?,
      category: json['category'] == null
          ? null
          : GalleryMediaCategoryDto.fromJson(
              json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GalleryMediaDtoToJson(GalleryMediaDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mediaItem': instance.mediaItem,
      'category': instance.category,
      'title': instance.title,
      'description': instance.description,
    };

GalleryMediaCategoryDto _$GalleryMediaCategoryDtoFromJson(
        Map<String, dynamic> json) =>
    GalleryMediaCategoryDto(
      id: (json['id'] as num?)?.toInt(),
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
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$GalleryMediaCategoryTranslationDtoToJson(
        GalleryMediaCategoryTranslationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

TitleDescriptionGalleriesDto _$TitleDescriptionGalleriesDtoFromJson(
        Map<String, dynamic> json) =>
    TitleDescriptionGalleriesDto(
      id: (json['id'] as num?)?.toInt(),
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
