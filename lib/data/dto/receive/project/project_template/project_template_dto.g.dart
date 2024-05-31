// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_template_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectTemplateDto _$ProjectTemplateDtoFromJson(Map<String, dynamic> json) =>
    ProjectTemplateDto(
      title: json['title'] as String?,
      type: $enumDecodeNullable(_$TEMPLATEEnumMap, json['type']),
      id: json['id'] as int?,
    );

Map<String, dynamic> _$ProjectTemplateDtoToJson(ProjectTemplateDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': _$TEMPLATEEnumMap[instance.type],
    };

const _$TEMPLATEEnumMap = {
  TEMPLATE.TEMPLATE_ONE: 'TEMPLATE_ONE',
  TEMPLATE.TEMPLATE_TWO: 'TEMPLATE_TWO',
  TEMPLATE.TEMPLATE_THREE: 'TEMPLATE_THREE',
  TEMPLATE.TEMPLATE_FOUR: 'TEMPLATE_FOUR',
};
