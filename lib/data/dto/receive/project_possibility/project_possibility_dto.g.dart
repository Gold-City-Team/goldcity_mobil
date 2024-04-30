// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_possibility_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectPossibilityDto _$ProjectPossibilityDtoFromJson(
        Map<String, dynamic> json) =>
    ProjectPossibilityDto(
      id: json['id'] as int?,
      location: json['location'] == null
          ? null
          : LocationDto.fromJson(json['location'] as Map<String, dynamic>),
      possibilities: (json['possibilities'] as List<dynamic>?)
          ?.map((e) => PossibilityDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectPossibilityDtoToJson(
        ProjectPossibilityDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'location': instance.location,
      'possibilities': instance.possibilities,
    };
