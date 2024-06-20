// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complex_template_eight_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplexTemplateEightDto _$ComplexTemplateEightDtoFromJson(
        Map<String, dynamic> json) =>
    ComplexTemplateEightDto(
      id: json['id'] as int?,
      titleDescriptionGalleries: (json['titleDescriptionGalleries']
              as List<dynamic>?)
          ?.map((e) =>
              TitleDescriptionGalleriesDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComplexTemplateEightDtoToJson(
        ComplexTemplateEightDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titleDescriptionGalleries': instance.titleDescriptionGalleries,
    };
