// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_features_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectFeaturesDto _$ProjectFeaturesDtoFromJson(Map<String, dynamic> json) =>
    ProjectFeaturesDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
      mediaItem: json['mediaItem'] == null
          ? null
          : MediaDto.fromJson(json['mediaItem'] as Map<String, dynamic>),
    )..value = json['value'] as String?;

Map<String, dynamic> _$ProjectFeaturesDtoToJson(ProjectFeaturesDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'value': instance.value,
      'mediaItem': instance.mediaItem,
    };
