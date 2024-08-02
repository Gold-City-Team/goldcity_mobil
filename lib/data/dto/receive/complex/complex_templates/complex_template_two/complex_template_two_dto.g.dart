// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complex_template_two_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplexTemplateTwoDto _$ComplexTemplateTwoDtoFromJson(
        Map<String, dynamic> json) =>
    ComplexTemplateTwoDto(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      mediaItem: json['mediaItem'] == null
          ? null
          : MediaDto.fromJson(json['mediaItem'] as Map<String, dynamic>),
      metaData: json['metaData'] == null
          ? null
          : ComplexTemplateTwoMetaDataDto.fromJson(
              json['metaData'] as Map<String, dynamic>),
      galleries: (json['galleries'] as List<dynamic>?)
          ?.map((e) => GalleryMediaDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComplexTemplateTwoDtoToJson(
        ComplexTemplateTwoDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'mediaItem': instance.mediaItem,
      'galleries': instance.galleries,
      'metaData': instance.metaData,
    };

ComplexTemplateTwoMetaDataDto _$ComplexTemplateTwoMetaDataDtoFromJson(
        Map<String, dynamic> json) =>
    ComplexTemplateTwoMetaDataDto(
      mainImagePosition: json['mainImagePosition'] as String?,
    );

Map<String, dynamic> _$ComplexTemplateTwoMetaDataDtoToJson(
        ComplexTemplateTwoMetaDataDto instance) =>
    <String, dynamic>{
      'mainImagePosition': instance.mainImagePosition,
    };
