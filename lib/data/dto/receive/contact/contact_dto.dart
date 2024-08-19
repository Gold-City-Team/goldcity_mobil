import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/contact/contact_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'contact_dto.g.dart';

@JsonSerializable()
class ContactDto {
  int? id;
  String? fullName;
  String? companyName;
  String? email;
  String? phoneNumber;
  String? whatsapp;
  MediaDto? emailImage;
  MediaDto? whatsappImage;
  MediaDto? phoneNumberImage;
  List<SocialMediaDto>? socialMedias;
  ContactDto(
      {this.id,
      this.fullName,
      this.companyName,
      this.email,
      this.whatsapp,
      this.phoneNumber,
      this.socialMedias,
      this.emailImage,
      this.phoneNumberImage,
      this.whatsappImage});
  factory ContactDto.fromJson(Map<String, dynamic> json) =>
      _$ContactDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ContactDtoToJson(this);

  ContactEntity toEntity() => ContactEntity(
        id: id ?? 0,
        fullName: fullName ?? "",
        companyName: companyName ?? "",
        email: email ?? "",
        whatsapp: whatsapp ?? "",
        phoneNumber: phoneNumber ?? "",
        whatsappImage: whatsappImage != null
            ? whatsappImage!.toEntity()
            : MediaDto().toEntity(),
        phoneNumberImage: phoneNumberImage != null
            ? phoneNumberImage!.toEntity()
            : MediaDto().toEntity(),
        emailImage:
            emailImage != null ? emailImage!.toEntity() : MediaDto().toEntity(),
        socialMedias: socialMedias != null
            ? socialMedias!.map((e) => e.toEntity()).toList()
            : [SocialMediaDto().toEntity()],
      );
}

@JsonSerializable()
class SocialMediaDto {
  MediaDto? mediaItem;
  String? url;

  SocialMediaDto({
    this.mediaItem,
    this.url,
  });

  factory SocialMediaDto.fromJson(Map<String, dynamic> json) =>
      _$SocialMediaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SocialMediaDtoToJson(this);

  SocialMediaEntity toEntity() => SocialMediaEntity(
      mediaItem:
          mediaItem != null ? mediaItem!.toEntity() : MediaDto().toEntity(),
      url: url ?? "");
}
