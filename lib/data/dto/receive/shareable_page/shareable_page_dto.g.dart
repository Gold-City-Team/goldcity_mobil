// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shareable_page_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShareablePageDto _$ShareablePageDtoFromJson(Map<String, dynamic> json) =>
    ShareablePageDto(
      id: json['id'] as String?,
      pageType: json['pageType'] as String?,
      creatorUser: json['creatorUser'] == null
          ? null
          : ShareablePageCreatorUserDto.fromJson(
              json['creatorUser'] as Map<String, dynamic>),
      pageId: (json['pageId'] as num?)?.toInt(),
      userType: json['userType'] as String?,
    );

Map<String, dynamic> _$ShareablePageDtoToJson(ShareablePageDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pageType': instance.pageType,
      'pageId': instance.pageId,
      'userType': instance.userType,
      'creatorUser': instance.creatorUser,
    };

ShareablePageCreatorUserDto _$ShareablePageCreatorUserDtoFromJson(
        Map<String, dynamic> json) =>
    ShareablePageCreatorUserDto(
      id: (json['id'] as num?)?.toInt(),
      company: json['company'] == null
          ? null
          : ShareablePageCreatorUserCompanyDto.fromJson(
              json['company'] as Map<String, dynamic>),
      name: json['name'] as String?,
    )
      ..email = json['email'] as String?
      ..tel = json['tel'] as String?;

Map<String, dynamic> _$ShareablePageCreatorUserDtoToJson(
        ShareablePageCreatorUserDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'company': instance.company,
      'name': instance.name,
      'email': instance.email,
      'tel': instance.tel,
    };

ShareablePageCreatorUserCompanyDto _$ShareablePageCreatorUserCompanyDtoFromJson(
        Map<String, dynamic> json) =>
    ShareablePageCreatorUserCompanyDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      tel: json['tel'] as String?,
    );

Map<String, dynamic> _$ShareablePageCreatorUserCompanyDtoToJson(
        ShareablePageCreatorUserCompanyDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tel': instance.tel,
    };
