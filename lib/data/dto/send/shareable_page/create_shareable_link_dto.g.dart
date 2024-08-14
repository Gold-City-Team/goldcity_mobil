// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_shareable_link_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateShareableLinkDto _$CreateShareableLinkDtoFromJson(
        Map<String, dynamic> json) =>
    CreateShareableLinkDto(
      pageType: json['pageType'] as String?,
      pageId: (json['pageId'] as num?)?.toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$CreateShareableLinkDtoToJson(
        CreateShareableLinkDto instance) =>
    <String, dynamic>{
      'pageType': instance.pageType,
      'pageId': instance.pageId,
      'title': instance.title,
    };
