// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaDto _$MediaDtoFromJson(Map<String, dynamic> json) => MediaDto(
      id: (json['id'] as num?)?.toInt(),
      url: json['url'] as String?,
      oldFileName: json['oldFileName'] as String?,
      mediaType: $enumDecodeNullable(_$MEDIA_TYPEEnumMap, json['mediaType']),
      metaData: json['metaData'] == null
          ? null
          : MediaMetaDataDto.fromJson(json['metaData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MediaDtoToJson(MediaDto instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'oldFileName': instance.oldFileName,
      'mediaType': _$MEDIA_TYPEEnumMap[instance.mediaType],
      'metaData': instance.metaData,
    };

const _$MEDIA_TYPEEnumMap = {
  MEDIA_TYPE.IMAGE: 'IMAGE',
  MEDIA_TYPE.VIDEO: 'VIDEO',
  MEDIA_TYPE.SVG: 'SVG',
  MEDIA_TYPE.PDF: 'PDF',
};

MediaMetaDataDto _$MediaMetaDataDtoFromJson(Map<String, dynamic> json) =>
    MediaMetaDataDto(
      ThumbnailUrl: json['ThumbnailUrl'] as String?,
    );

Map<String, dynamic> _$MediaMetaDataDtoToJson(MediaMetaDataDto instance) =>
    <String, dynamic>{
      'ThumbnailUrl': instance.ThumbnailUrl,
    };
