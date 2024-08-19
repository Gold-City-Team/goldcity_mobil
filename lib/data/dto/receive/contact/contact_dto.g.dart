// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactDto _$ContactDtoFromJson(Map<String, dynamic> json) => ContactDto(
      id: (json['id'] as num?)?.toInt(),
      fullName: json['fullName'] as String?,
      companyName: json['companyName'] as String?,
      email: json['email'] as String?,
      whatsapp: json['whatsapp'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      socialMedias: (json['socialMedias'] as List<dynamic>?)
          ?.map((e) => SocialMediaDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      emailImage: json['emailImage'] == null
          ? null
          : MediaDto.fromJson(json['emailImage'] as Map<String, dynamic>),
      phoneNumberImage: json['phoneNumberImage'] == null
          ? null
          : MediaDto.fromJson(json['phoneNumberImage'] as Map<String, dynamic>),
      whatsappImage: json['whatsappImage'] == null
          ? null
          : MediaDto.fromJson(json['whatsappImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContactDtoToJson(ContactDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'companyName': instance.companyName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'whatsapp': instance.whatsapp,
      'emailImage': instance.emailImage,
      'whatsappImage': instance.whatsappImage,
      'phoneNumberImage': instance.phoneNumberImage,
      'socialMedias': instance.socialMedias,
    };

SocialMediaDto _$SocialMediaDtoFromJson(Map<String, dynamic> json) =>
    SocialMediaDto(
      mediaItem: json['mediaItem'] == null
          ? null
          : MediaDto.fromJson(json['mediaItem'] as Map<String, dynamic>),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$SocialMediaDtoToJson(SocialMediaDto instance) =>
    <String, dynamic>{
      'mediaItem': instance.mediaItem,
      'url': instance.url,
    };
