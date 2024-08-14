// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_template_eight_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectTemplateEightDto _$ProjectTemplateEightDtoFromJson(
        Map<String, dynamic> json) =>
    ProjectTemplateEightDto(
      id: (json['id'] as num?)?.toInt(),
      titleDescriptionGalleries: (json['titleDescriptionGalleries']
              as List<dynamic>?)
          ?.map((e) =>
              TitleDescriptionGalleriesDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      metaData: json['metaData'] == null
          ? null
          : ProjectTemplateEightMetaDataDto.fromJson(
              json['metaData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProjectTemplateEightDtoToJson(
        ProjectTemplateEightDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titleDescriptionGalleries': instance.titleDescriptionGalleries,
      'metaData': instance.metaData,
    };

ProjectTemplateEightMetaDataDto _$ProjectTemplateEightMetaDataDtoFromJson(
        Map<String, dynamic> json) =>
    ProjectTemplateEightMetaDataDto(
      isFilterable: json['isFilterable'] as bool?,
    );

Map<String, dynamic> _$ProjectTemplateEightMetaDataDtoToJson(
        ProjectTemplateEightMetaDataDto instance) =>
    <String, dynamic>{
      'isFilterable': instance.isFilterable,
    };
