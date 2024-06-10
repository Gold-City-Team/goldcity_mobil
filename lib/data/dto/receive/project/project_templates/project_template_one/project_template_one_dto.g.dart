// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_template_one_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectTemplateOneDto _$ProjectTemplateOneDtoFromJson(
        Map<String, dynamic> json) =>
    ProjectTemplateOneDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      mediaItem: json['mediaItem'] == null
          ? null
          : MediaDto.fromJson(json['mediaItem'] as Map<String, dynamic>),
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => FeaturesDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectTemplateOneDtoToJson(
        ProjectTemplateOneDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'mediaItem': instance.mediaItem,
      'features': instance.features,
    };
