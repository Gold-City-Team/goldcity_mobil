// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complex_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplexDto _$ComplexDtoFromJson(Map<String, dynamic> json) => ComplexDto(
      id: json['id'] as int?,
      complexDetail: json['complexDetail'] == null
          ? null
          : ComplexDetailDto.fromJson(
              json['complexDetail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComplexDtoToJson(ComplexDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'complexDetail': instance.complexDetail,
    };
