// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EducationDetailDto _$EducationDetailDtoFromJson(Map<String, dynamic> json) =>
    EducationDetailDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      mainImage: json['mainImage'] == null
          ? null
          : MediaDto.fromJson(json['mainImage'] as Map<String, dynamic>),
      educationGalleries: (json['educationGalleries'] as List<dynamic>?)
          ?.map((e) => GalleryMediaDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EducationDetailDtoToJson(EducationDetailDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'mainImage': instance.mainImage,
      'educationGalleries': instance.educationGalleries,
    };
