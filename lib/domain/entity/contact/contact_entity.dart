import 'package:goldcity/domain/entity/media/media_entity.dart';

class ContactEntity {
  final int id;
  final String fullName;
  final String companyName;
  final String email;
  final String phoneNumber;
  List<SocialMediaEntity> socialMedias;

  ContactEntity({
    required this.id,
    required this.fullName,
    required this.companyName,
    required this.email,
    required this.phoneNumber,
    required this.socialMedias,
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
