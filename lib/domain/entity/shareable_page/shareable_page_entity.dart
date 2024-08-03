import 'package:json_annotation/json_annotation.dart';

class ShareablePageEntity {
  String id;
  String pageType;
  int pageId;
  String userType;
  ShareablePageCreatorUserEntity creatorUser;
  ShareablePageEntity({
    required this.id,
    required this.pageType,
    required this.creatorUser,
    required this.pageId,
    required this.userType,
  });
}

@JsonSerializable()
class ShareablePageCreatorUserEntity {
  int id;
  ShareablePageCreatorUserCompanyEntity company;
  String name;
  String tel;
  String email;
  ShareablePageCreatorUserEntity({
    required this.id,
    required this.company,
    required this.name,
    required this.tel,
    required this.email,
  });
}

@JsonSerializable()
class ShareablePageCreatorUserCompanyEntity {
  int id;
  String name;
  String tel;
  ShareablePageCreatorUserCompanyEntity({
    required this.id,
    required this.name,
    required this.tel,
  });
}
