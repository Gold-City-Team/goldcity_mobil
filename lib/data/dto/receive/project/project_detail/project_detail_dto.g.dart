// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectDetailDto _$ProjectDetailDtoFromJson(Map<String, dynamic> json) =>
    ProjectDetailDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
      slogan: json['slogan'] as String?,
      language: json['language'] == null
          ? null
          : LanguageDto.fromJson(json['language'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : LocationDto.fromJson(json['location'] as Map<String, dynamic>),
      mediaItem: json['mediaItem'] == null
          ? null
          : MediaDto.fromJson(json['mediaItem'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProjectDetailDtoToJson(ProjectDetailDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slogan': instance.slogan,
      'language': instance.language,
      'location': instance.location,
      'mediaItem': instance.mediaItem,
    };
