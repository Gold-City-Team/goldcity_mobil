// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complex_template_one_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplexTemplateOneDto _$ComplexTemplateOneDtoFromJson(
        Map<String, dynamic> json) =>
    ComplexTemplateOneDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      mediaItem: json['mediaItem'] == null
          ? null
          : MediaDto.fromJson(json['mediaItem'] as Map<String, dynamic>),
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => ProjectFeaturesDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComplexTemplateOneDtoToJson(
        ComplexTemplateOneDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'mediaItem': instance.mediaItem,
      'features': instance.features,
    };
