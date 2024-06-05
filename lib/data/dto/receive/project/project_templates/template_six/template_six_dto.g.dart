// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_six_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemplateSixDto _$TemplateSixDtoFromJson(Map<String, dynamic> json) =>
    TemplateSixDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
      homes: (json['homes'] as List<dynamic>?)
          ?.map((e) => ProjectHomeDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TemplateSixDtoToJson(TemplateSixDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'homes': instance.homes,
    };

ProjectHomeDto _$ProjectHomeDtoFromJson(Map<String, dynamic> json) =>
    ProjectHomeDto(
      id: json['id'] as int?,
      blok: json['blok'] as String?,
      no: json['no'] as String?,
      floor: json['floor'] as String?,
      area: json['area'] as String?,
      price: json['price'] as String?,
      type: json['type'] as String?,
      state: $enumDecodeNullable(_$HOME_STATEEnumMap, json['state']),
    );

Map<String, dynamic> _$ProjectHomeDtoToJson(ProjectHomeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'blok': instance.blok,
      'no': instance.no,
      'floor': instance.floor,
      'area': instance.area,
      'price': instance.price,
      'type': instance.type,
      'state': _$HOME_STATEEnumMap[instance.state],
    };

const _$HOME_STATEEnumMap = {
  HOME_STATE.RESERVED: 'RESERVED',
  HOME_STATE.SELLED: 'SELLED',
  HOME_STATE.WAITING: 'WAITING',
};
