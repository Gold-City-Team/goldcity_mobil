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
          ?.map((e) => TemplateGalleryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..subTitle = json['subTitle'] as String?;

Map<String, dynamic> _$TemplateTwoDtoToJson(TemplateTwoDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'description': instance.description,
      'mediaItem': instance.mediaItem,
      'galleries': instance.galleries,
    };
