// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complex_template_seven_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplexTemplateSevenDto _$ComplexTemplateSevenDtoFromJson(
        Map<String, dynamic> json) =>
    ComplexTemplateSevenDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      galleries: (json['galleries'] as List<dynamic>?)
          ?.map((e) => GalleryMediaDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      mediaItem: json['mediaItem'] == null
          ? null
          : MediaDto.fromJson(json['mediaItem'] as Map<String, dynamic>),
      verticalGalleries: (json['verticalGalleries'] as List<dynamic>?)
          ?.map((e) => GalleryMediaDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComplexTemplateSevenDtoToJson(
        ComplexTemplateSevenDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'galleries': instance.galleries,
      'mediaItem': instance.mediaItem,
      'verticalGalleries': instance.verticalGalleries,
    };
