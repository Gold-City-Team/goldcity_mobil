// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_five_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemplateFiveDto _$TemplateFiveDtoFromJson(Map<String, dynamic> json) =>
    TemplateFiveDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
      medias: (json['medias'] as List<dynamic>?)
          ?.map((e) => TemplateGalleryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TemplateFiveDtoToJson(TemplateFiveDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'medias': instance.medias,
    };
