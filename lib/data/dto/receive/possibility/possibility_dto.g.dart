// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'possibility_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PossibilityDto _$PossibilityDtoFromJson(Map<String, dynamic> json) =>
    PossibilityDto(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      color: json['color'] as String,
      location: LocationDto.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PossibilityDtoToJson(PossibilityDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'color': instance.color,
      'location': instance.location,
    };
