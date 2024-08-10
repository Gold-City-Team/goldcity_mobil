// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complex_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplexDto _$ComplexDtoFromJson(Map<String, dynamic> json) => ComplexDto(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      slogan: json['slogan'] as String?,
      complexDetail: json['complexDetail'] == null
          ? null
          : ComplexDetailDto.fromJson(
              json['complexDetail'] as Map<String, dynamic>),
    )
      ..languages = (json['languages'] as List<dynamic>?)
          ?.map((e) => LanguageDetailDto.fromJson(e as Map<String, dynamic>))
          .toList()
      ..mainImage = json['mainImage'] == null
          ? null
          : MediaDto.fromJson(json['mainImage'] as Map<String, dynamic>)
      ..logo = json['logo'] == null
          ? null
          : MediaDto.fromJson(json['logo'] as Map<String, dynamic>);

Map<String, dynamic> _$ComplexDtoToJson(ComplexDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slogan': instance.slogan,
      'languages': instance.languages,
      'mainImage': instance.mainImage,
      'logo': instance.logo,
      'complexDetail': instance.complexDetail,
    };
