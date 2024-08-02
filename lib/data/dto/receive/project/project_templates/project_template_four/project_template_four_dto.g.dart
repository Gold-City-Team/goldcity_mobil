// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_template_four_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectTemplateFourDto _$ProjectTemplateFourDtoFromJson(
        Map<String, dynamic> json) =>
    ProjectTemplateFourDto(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      mediaItem: json['mediaItem'] == null
          ? null
          : MediaDto.fromJson(json['mediaItem'] as Map<String, dynamic>),
      galleries: (json['galleries'] as List<dynamic>?)
          ?.map((e) => GalleryMediaDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => FeaturesDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectTemplateFourDtoToJson(
        ProjectTemplateFourDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'mediaItem': instance.mediaItem,
      'features': instance.features,
      'galleries': instance.galleries,
    };
