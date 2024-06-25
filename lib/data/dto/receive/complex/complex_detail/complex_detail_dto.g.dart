// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complex_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplexDetailDto _$ComplexDetailDtoFromJson(Map<String, dynamic> json) =>
    ComplexDetailDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
      mainVideo: json['mainVideo'] == null
          ? null
          : MediaDto.fromJson(json['mainVideo'] as Map<String, dynamic>),
      logo: json['logo'] == null
          ? null
          : MediaDto.fromJson(json['logo'] as Map<String, dynamic>),
      templates: (json['templates'] as List<dynamic>?)
          ?.map((e) => MainTemplateDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      slogan: json['slogan'] as String?,
    );

Map<String, dynamic> _$ComplexDetailDtoToJson(ComplexDetailDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slogan': instance.slogan,
      'mainVideo': instance.mainVideo,
      'logo': instance.logo,
      'templates': instance.templates,
    };
