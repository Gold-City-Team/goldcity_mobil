// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'possibility_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PossibilityDto _$PossibilityDtoFromJson(Map<String, dynamic> json) =>
    PossibilityDto(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      color: (json['color'] as num?)?.toDouble(),
      location: json['location'] == null
          ? null
          : LocationDto.fromJson(json['location'] as Map<String, dynamic>),
      mediaItem: json['mediaItem'] == null
          ? null
          : MediaDto.fromJson(json['mediaItem'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : CategoryDto.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PossibilityDtoToJson(PossibilityDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'color': instance.color,
      'location': instance.location,
      'mediaItem': instance.mediaItem,
      'category': instance.category,
    };

LocationDto _$LocationDtoFromJson(Map<String, dynamic> json) => LocationDto(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LocationDtoToJson(LocationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) => CategoryDto(
      id: (json['id'] as num?)?.toInt(),
      translation: json['translation'] == null
          ? null
          : TranslationDto.fromJson(
              json['translation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryDtoToJson(CategoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'translation': instance.translation,
    };

TranslationDto _$TranslationDtoFromJson(Map<String, dynamic> json) =>
    TranslationDto(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$TranslationDtoToJson(TranslationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
