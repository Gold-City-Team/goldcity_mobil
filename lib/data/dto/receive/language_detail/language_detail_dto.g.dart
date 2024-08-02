// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageDetailDto _$LanguageDetailDtoFromJson(Map<String, dynamic> json) =>
    LanguageDetailDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      code: json['code'] as String?,
      mediaItem: json['mediaItem'] == null
          ? null
          : MediaDto.fromJson(json['mediaItem'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LanguageDetailDtoToJson(LanguageDetailDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'mediaItem': instance.mediaItem,
    };
