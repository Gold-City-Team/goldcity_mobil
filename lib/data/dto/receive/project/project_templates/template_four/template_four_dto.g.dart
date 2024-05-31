// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_four_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemplateFourDto _$TemplateFourDtoFromJson(Map<String, dynamic> json) =>
    TemplateFourDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
      mediaItem: json['mediaItem'] == null
          ? null
          : MediaDto.fromJson(json['mediaItem'] as Map<String, dynamic>),
      galleries: (json['galleries'] as List<dynamic>?)
          ?.map((e) => TemplateGalleryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => ProjectFeaturesDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TemplateFourDtoToJson(TemplateFourDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'mediaItem': instance.mediaItem,
      'features': instance.features,
      'galleries': instance.galleries,
    };
