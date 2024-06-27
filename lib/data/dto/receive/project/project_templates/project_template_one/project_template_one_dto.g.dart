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
      logo: json['logo'] == null
          ? null
          : MediaDto.fromJson(json['logo'] as Map<String, dynamic>),
      mainImage: json['mainImage'] == null
          ? null
          : MediaDto.fromJson(json['mainImage'] as Map<String, dynamic>),
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
      'logo': instance.logo,
      'mainImage': instance.mainImage,
      'features': instance.features,
    };
