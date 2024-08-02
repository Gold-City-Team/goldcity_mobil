// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageDto _$LanguageDtoFromJson(Map<String, dynamic> json) => LanguageDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$LanguageDtoToJson(LanguageDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
    };
