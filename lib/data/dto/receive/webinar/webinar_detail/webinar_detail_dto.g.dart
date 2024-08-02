// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webinar_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebinarDetailDto _$WebinarDetailDtoFromJson(Map<String, dynamic> json) =>
    WebinarDetailDto(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      mediaItem: json['mediaItem'] == null
          ? null
          : MediaDto.fromJson(json['mediaItem'] as Map<String, dynamic>),
      scheduledStartDate: json['scheduledStartDate'] == null
          ? null
          : DateTime.parse(json['scheduledStartDate'] as String),
      isRegister: json['isRegister'] as bool?,
    );

Map<String, dynamic> _$WebinarDetailDtoToJson(WebinarDetailDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'mediaItem': instance.mediaItem,
      'scheduledStartDate': instance.scheduledStartDate?.toIso8601String(),
      'isRegister': instance.isRegister,
    };
