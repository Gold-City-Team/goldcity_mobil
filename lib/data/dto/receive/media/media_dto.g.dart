// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaDto _$MediaDtoFromJson(Map<String, dynamic> json) => MediaDto(
      id: json['id'] as int?,
      url: json['url'] as String?,
      mediaType: $enumDecodeNullable(_$MEDIA_TYPEEnumMap, json['mediaType']),
    );

Map<String, dynamic> _$MediaDtoToJson(MediaDto instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'mediaType': _$MEDIA_TYPEEnumMap[instance.mediaType],
    };

const _$MEDIA_TYPEEnumMap = {
  MEDIA_TYPE.IMAGE: 'IMAGE',
  MEDIA_TYPE.VIDEO: 'VIDEO',
};