// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_template_six_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectTemplateSixDto _$ProjectTemplateSixDtoFromJson(
        Map<String, dynamic> json) =>
    ProjectTemplateSixDto(
      id: json['id'] as int?,
      galleries: (json['galleries'] as List<dynamic>?)
          ?.map((e) => GalleryMediaDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      homes: (json['homes'] as List<dynamic>?)
          ?.map((e) => ProjectHomeDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectTemplateSixDtoToJson(
        ProjectTemplateSixDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'homes': instance.homes,
      'galleries': instance.galleries,
    };

ProjectHomeDto _$ProjectHomeDtoFromJson(Map<String, dynamic> json) =>
    ProjectHomeDto(
      id: json['id'] as int?,
      block: json['block'] as String?,
      number: json['number'] as String?,
      floor: json['floor'] as String?,
      price: json['price'] as String?,
      area: json['area'] as String?,
      roomSize: json['roomSize'] as String?,
      homeType: json['homeType'] as String?,
      saleState: $enumDecodeNullable(_$HOME_STATEEnumMap, json['saleState']),
    );

Map<String, dynamic> _$ProjectHomeDtoToJson(ProjectHomeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'block': instance.block,
      'number': instance.number,
      'roomSize': instance.roomSize,
      'floor': instance.floor,
      'area': instance.area,
      'price': instance.price,
      'homeType': instance.homeType,
      'saleState': _$HOME_STATEEnumMap[instance.saleState],
    };

const _$HOME_STATEEnumMap = {
  HOME_STATE.RESERVED: 'RESERVED',
  HOME_STATE.SOLD: 'SOLD',
  HOME_STATE.ON_SALE: 'ON_SALE',
};
