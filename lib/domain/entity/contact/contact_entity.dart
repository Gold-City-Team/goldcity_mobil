import 'package:goldcity/domain/entity/media/media_entity.dart';

class ContactEntity {
  final int id;
  final String fullName;
  final String companyName;
  final String email;
  final String whatsapp;
  final String phoneNumber;
  final List<SocialMediaEntity> socialMedias;
  final MediaEntity emailImage;
  final MediaEntity whatsappImage;
  final MediaEntity phoneNumberImage;
  ContactEntity({
    required this.id,
    required this.fullName,
    required this.companyName,
    required this.email,
    required this.whatsapp,
    required this.phoneNumber,
    required this.socialMedias,
    required this.emailImage,
    required this.whatsappImage,
    required this.phoneNumberImage,
  });
}

class SocialMediaEntity {
  final MediaEntity mediaItem;
  final String url;

  SocialMediaEntity({
    required this.mediaItem,
    required this.url,
  });
}
