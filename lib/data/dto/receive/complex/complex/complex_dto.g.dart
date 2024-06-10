// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complex_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplexDto _$ComplexDtoFromJson(Map<String, dynamic> json) => ComplexDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
      mainImage: json['mainImage'] == null
          ? null
          : MediaDto.fromJson(json['mainImage'] as Map<String, dynamic>),
      logo: json['logo'] == null
          ? null
          : MediaDto.fromJson(json['logo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComplexDtoToJson(ComplexDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'mainImage': instance.mainImage,
      'logo': instance.logo,
    };
