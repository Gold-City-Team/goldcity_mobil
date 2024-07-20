// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_template_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainTemplateDto _$MainTemplateDtoFromJson(Map<String, dynamic> json) =>
    MainTemplateDto(
      title: json['title'] as String?,
      type: $enumDecodeNullable(_$TEMPLATEEnumMap, json['type']),
      id: json['id'] as int?,
      metaData: json['metaData'] == null
          ? null
          : MainTemplateMetaDataDto.fromJson(
              json['metaData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MainTemplateDtoToJson(MainTemplateDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': _$TEMPLATEEnumMap[instance.type],
      'metaData': instance.metaData,
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
  TEMPLATE.PROJECT_TEMPLATE_NINE: 'PROJECT_TEMPLATE_NINE',
  TEMPLATE.COMPLEX_TEMPLATE_ONE: 'COMPLEX_TEMPLATE_ONE',
  TEMPLATE.COMPLEX_TEMPLATE_TWO: 'COMPLEX_TEMPLATE_TWO',
  TEMPLATE.COMPLEX_TEMPLATE_THREE: 'COMPLEX_TEMPLATE_THREE',
  TEMPLATE.COMPLEX_TEMPLATE_FOUR: 'COMPLEX_TEMPLATE_FOUR',
  TEMPLATE.COMPLEX_TEMPLATE_SEVEN: 'COMPLEX_TEMPLATE_SEVEN',
};

MainTemplateMetaDataDto _$MainTemplateMetaDataDtoFromJson(
        Map<String, dynamic> json) =>
    MainTemplateMetaDataDto(
      viewType: json['viewType'] as String?,
    );

Map<String, dynamic> _$MainTemplateMetaDataDtoToJson(
        MainTemplateMetaDataDto instance) =>
    <String, dynamic>{
      'viewType': instance.viewType,
    };
