// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complex_template_four_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplexTemplateFourDto _$ComplexTemplateFourDtoFromJson(
        Map<String, dynamic> json) =>
    ComplexTemplateFourDto(
      id: json['id'] as int?,
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

Map<String, dynamic> _$ComplexTemplateFourDtoToJson(
        ComplexTemplateFourDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'mediaItem': instance.mediaItem,
      'features': instance.features,
      'galleries': instance.galleries,
    };
