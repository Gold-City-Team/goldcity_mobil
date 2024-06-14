// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complex_template_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplexTemplateDto _$ComplexTemplateDtoFromJson(Map<String, dynamic> json) =>
    ComplexTemplateDto(
      id: json['id'] as int?,
      type: $enumDecodeNullable(_$TEMPLATEEnumMap, json['type']),
      template: json['template'],
    );

Map<String, dynamic> _$ComplexTemplateDtoToJson(ComplexTemplateDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$TEMPLATEEnumMap[instance.type],
      'template': instance.template,
    };

const _$TEMPLATEEnumMap = {
  TEMPLATE.PROJECT_TEMPLATE_ONE: 'PROJECT_TEMPLATE_ONE',
  TEMPLATE.PROJECT_TEMPLATE_TWO: 'PROJECT_TEMPLATE_TWO',
  TEMPLATE.PROJECT_TEMPLATE_THREE: 'PROJECT_TEMPLATE_THREE',
  TEMPLATE.PROJECT_TEMPLATE_FOUR: 'PROJECT_TEMPLATE_FOUR',
  TEMPLATE.PROJECT_TEMPLATE_FIVE: 'PROJECT_TEMPLATE_FIVE',
  TEMPLATE.PROJECT_TEMPLATE_SIX: 'PROJECT_TEMPLATE_SIX',
  TEMPLATE.PROJECT_TEMPLATE_SEVEN: 'PROJECT_TEMPLATE_SEVEN',
  TEMPLATE.PROJECT_TEMPLATE_EIGHT: 'PROJECT_TEMPLATE_EIGHT',
  TEMPLATE.COMPLEX_TEMPLATE_ONE: 'COMPLEX_TEMPLATE_ONE',
  TEMPLATE.COMPLEX_TEMPLATE_TWO: 'COMPLEX_TEMPLATE_TWO',
  TEMPLATE.COMPLEX_TEMPLATE_THREE: 'COMPLEX_TEMPLATE_THREE',
  TEMPLATE.COMPLEX_TEMPLATE_FOUR: 'COMPLEX_TEMPLATE_FOUR',
};
