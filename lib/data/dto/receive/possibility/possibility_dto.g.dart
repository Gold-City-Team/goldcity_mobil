// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'possibility_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PossibilityDto _$PossibilityDtoFromJson(Map<String, dynamic> json) =>
    PossibilityDto(
      id: json['id'] as int,
      location: LocationDto.fromJson(json['location'] as Map<String, dynamic>),
      possibilities: (json['possibilities'] as List<dynamic>)
          .map((e) => LocationDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PossibilityDtoToJson(PossibilityDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'location': instance.location,
      'possibilities': instance.possibilities,
    };
