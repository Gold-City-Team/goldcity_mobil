// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_template_nine_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectTemplateNineDto _$ProjectTemplateNineDtoFromJson(
        Map<String, dynamic> json) =>
    ProjectTemplateNineDto(
      id: json['id'] as int?,
      campaigns: (json['campaigns'] as List<dynamic>?)
          ?.map((e) => ProjectTemplateNineCampaignsDto.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectTemplateNineDtoToJson(
        ProjectTemplateNineDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'campaigns': instance.campaigns,
    };

ProjectTemplateNineCampaignsDto _$ProjectTemplateNineCampaignsDtoFromJson(
        Map<String, dynamic> json) =>
    ProjectTemplateNineCampaignsDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      mainImage: json['mainImage'] == null
          ? null
          : MediaDto.fromJson(json['mainImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProjectTemplateNineCampaignsDtoToJson(
        ProjectTemplateNineCampaignsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'mainImage': instance.mainImage,
    };
