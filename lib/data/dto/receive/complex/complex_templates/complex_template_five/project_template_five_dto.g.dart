// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complex_template_five_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectTemplateFiveDto _$ProjectTemplateFiveDtoFromJson(
        Map<String, dynamic> json) =>
    ProjectTemplateFiveDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
      medias: (json['medias'] as List<dynamic>?)
          ?.map((e) => GalleryMediaDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectTemplateFiveDtoToJson(
        ProjectTemplateFiveDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'medias': instance.medias,
    };
