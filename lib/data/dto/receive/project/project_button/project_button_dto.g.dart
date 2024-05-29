// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: constant_identifier_names

part of 'project_button_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectButtonDto _$ProjectButtonDtoFromJson(Map<String, dynamic> json) =>
    ProjectButtonDto(
      title: json['title'] as String?,
      type: $enumDecodeNullable(_$PROJECT_BUTTON_TYPEEnumMap, json['type']),
    );

Map<String, dynamic> _$ProjectButtonDtoToJson(ProjectButtonDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'type': _$PROJECT_BUTTON_TYPEEnumMap[instance.type],
    };

const _$PROJECT_BUTTON_TYPEEnumMap = {
  PROJECT_BUTTON_TYPE.INTERIOR_GALLERY: 'INTERIOR_GALLERY',
  PROJECT_BUTTON_TYPE.OUTDOOR_GALLERY: 'OUTDOOR_GALLERY',
  PROJECT_BUTTON_TYPE.POSSIBILITY: 'POSSIBILITY',
  PROJECT_BUTTON_TYPE.AWARD: 'AWARD',
};
