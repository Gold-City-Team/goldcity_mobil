// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'features_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeaturesDto _$FeaturesDtoFromJson(Map<String, dynamic> json) => FeaturesDto(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      value: json['value'] as String?,
      mediaItem: json['mediaItem'] == null
          ? null
          : MediaDto.fromJson(json['mediaItem'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeaturesDtoToJson(FeaturesDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'value': instance.value,
      'mediaItem': instance.mediaItem,
    };
