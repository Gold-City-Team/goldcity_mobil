// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complex_template_five_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplexTemplateFiveDto _$ComplexTemplateFiveDtoFromJson(
        Map<String, dynamic> json) =>
    ComplexTemplateFiveDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
      medias: (json['medias'] as List<dynamic>?)
          ?.map((e) => GalleryMediaDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComplexTemplateFiveDtoToJson(
        ComplexTemplateFiveDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'medias': instance.medias,
    };
