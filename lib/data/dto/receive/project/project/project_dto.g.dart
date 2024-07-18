// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectDto _$ProjectDtoFromJson(Map<String, dynamic> json) => ProjectDto(
      id: json['id'] as int?,
      projectDetail: json['projectDetail'] == null
          ? null
          : ProjectDetailDto.fromJson(
              json['projectDetail'] as Map<String, dynamic>),
      logo: json['logo'] == null
          ? null
          : MediaDto.fromJson(json['logo'] as Map<String, dynamic>),
      mainImage: json['mainImage'] == null
          ? null
          : MediaDto.fromJson(json['mainImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProjectDtoToJson(ProjectDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectDetail': instance.projectDetail,
      'logo': instance.logo,
      'mainImage': instance.mainImage,
    };
