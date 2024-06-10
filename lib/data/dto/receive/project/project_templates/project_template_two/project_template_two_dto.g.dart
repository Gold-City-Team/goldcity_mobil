// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_template_two_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectTemplateTwoDto _$ProjectTemplateTwoDtoFromJson(
        Map<String, dynamic> json) =>
    ProjectTemplateTwoDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      mediaItem: json['mediaItem'] == null
          ? null
          : MediaDto.fromJson(json['mediaItem'] as Map<String, dynamic>),
      metaData: json['metaData'] == null
          ? null
          : ProjectTemplateTwoMetaDataDto.fromJson(
              json['metaData'] as Map<String, dynamic>),
      galleries: (json['galleries'] as List<dynamic>?)
          ?.map((e) => GalleryMediaDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..subTitle = json['subTitle'] as String?;

Map<String, dynamic> _$ProjectTemplateTwoDtoToJson(
        ProjectTemplateTwoDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'description': instance.description,
      'mediaItem': instance.mediaItem,
      'galleries': instance.galleries,
      'metaData': instance.metaData,
    };

ProjectTemplateTwoMetaDataDto _$ProjectTemplateTwoMetaDataDtoFromJson(
        Map<String, dynamic> json) =>
    ProjectTemplateTwoMetaDataDto(
      mainImagePosition: json['mainImagePosition'] as String?,
    );

Map<String, dynamic> _$ProjectTemplateTwoMetaDataDtoToJson(
        ProjectTemplateTwoMetaDataDto instance) =>
    <String, dynamic>{
      'mainImagePosition': instance.mainImagePosition,
    };
