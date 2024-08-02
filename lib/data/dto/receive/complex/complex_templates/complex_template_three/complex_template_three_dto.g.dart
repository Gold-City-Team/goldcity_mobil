// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complex_template_three_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplexTemplateThreeDto _$ComplexTemplateThreeDtoFromJson(
        Map<String, dynamic> json) =>
    ComplexTemplateThreeDto(
      id: (json['id'] as num?)?.toInt(),
      location: json['location'] == null
          ? null
          : LocationDto.fromJson(json['location'] as Map<String, dynamic>),
      possibilities: (json['possibilities'] as List<dynamic>?)
          ?.map((e) => PossibilityDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComplexTemplateThreeDtoToJson(
        ComplexTemplateThreeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'location': instance.location,
      'possibilities': instance.possibilities,
    };
