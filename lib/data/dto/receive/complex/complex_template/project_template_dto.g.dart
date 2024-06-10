// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_template_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplexTemplateDto _$ComplexTemplateDtoFromJson(Map<String, dynamic> json) =>
    ComplexTemplateDto(
      title: json['title'] as String?,
      type: $enumDecodeNullable(_$COMPLEX_TEMPLATEEnumMap, json['type']),
      id: json['id'] as int?,
    );

Map<String, dynamic> _$ComplexTemplateDtoToJson(ComplexTemplateDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': _$COMPLEX_TEMPLATEEnumMap[instance.type],
    };

const _$COMPLEX_TEMPLATEEnumMap = {
  COMPLEX_TEMPLATE.TEMPLATE_ONE: 'TEMPLATE_ONE',
  COMPLEX_TEMPLATE.TEMPLATE_TWO: 'TEMPLATE_TWO',
};
