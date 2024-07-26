// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnouncementDto _$AnnouncementDtoFromJson(Map<String, dynamic> json) =>
    AnnouncementDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => AnnouncementFileDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnnouncementDtoToJson(AnnouncementDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'attachments': instance.attachments,
    };

AnnouncementFileDto _$AnnouncementFileDtoFromJson(Map<String, dynamic> json) =>
    AnnouncementFileDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
      file: json['file'] == null
          ? null
          : MediaDto.fromJson(json['file'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnnouncementFileDtoToJson(
        AnnouncementFileDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'file': instance.file,
    };
