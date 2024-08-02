// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_webinar_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserWebinarDto _$UserWebinarDtoFromJson(Map<String, dynamic> json) =>
    UserWebinarDto(
      (json['id'] as num?)?.toInt(),
      json['meeting'] == null
          ? null
          : WebinarDetailDto.fromJson(json['meeting'] as Map<String, dynamic>),
      json['joinUrl'] as String?,
    );

Map<String, dynamic> _$UserWebinarDtoToJson(UserWebinarDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meeting': instance.meeting,
      'joinUrl': instance.joinUrl,
    };
