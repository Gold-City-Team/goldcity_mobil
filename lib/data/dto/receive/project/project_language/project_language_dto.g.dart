// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_language_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectLanguageDetailDto _$ProjectLanguageDetailDtoFromJson(
        Map<String, dynamic> json) =>
    ProjectLanguageDetailDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$ProjectLanguageDetailDtoToJson(
        ProjectLanguageDetailDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
    };
