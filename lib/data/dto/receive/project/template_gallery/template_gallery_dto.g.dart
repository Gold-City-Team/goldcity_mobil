// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_gallery_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemplateGalleryDto _$TemplateGalleryDtoFromJson(Map<String, dynamic> json) =>
    TemplateGalleryDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
      mediaItem: json['mediaItem'] == null
          ? null
          : MediaDto.fromJson(json['mediaItem'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : TemplateGalleryCategoryDto.fromJson(
              json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TemplateGalleryDtoToJson(TemplateGalleryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'mediaItem': instance.mediaItem,
    };

TemplateGalleryCategoryDto _$TemplateGalleryCategoryDtoFromJson(
        Map<String, dynamic> json) =>
    TemplateGalleryCategoryDto(
      id: json['id'] as int?,
      translation: json['translation'] == null
          ? null
          : TemplateGalleryCategoryTranslationDto.fromJson(
              json['translation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TemplateGalleryCategoryDtoToJson(
        TemplateGalleryCategoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'translation': instance.translation,
    };

TemplateGalleryCategoryTranslationDto
    _$TemplateGalleryCategoryTranslationDtoFromJson(
            Map<String, dynamic> json) =>
        TemplateGalleryCategoryTranslationDto(
          languageId: json['languageId'] as int?,
          title: json['title'] as String?,
        );

Map<String, dynamic> _$TemplateGalleryCategoryTranslationDtoToJson(
        TemplateGalleryCategoryTranslationDto instance) =>
    <String, dynamic>{
      'languageId': instance.languageId,
      'title': instance.title,
    };
