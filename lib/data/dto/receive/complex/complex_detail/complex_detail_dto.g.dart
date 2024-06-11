// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complex_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplexDetailDto _$ComplexDetailDtoFromJson(Map<String, dynamic> json) =>
    ComplexDetailDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
      mainImage: json['mainImage'] == null
          ? null
          : MediaDto.fromJson(json['mainImage'] as Map<String, dynamic>),
      logo: json['logo'] == null
          ? null
          : MediaDto.fromJson(json['logo'] as Map<String, dynamic>),
      template: (json['template'] as List<dynamic>?)
          ?.map((e) => MainTemplateDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComplexDetailDtoToJson(ComplexDetailDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'mainImage': instance.mainImage,
      'logo': instance.logo,
      'template': instance.template,
    };
