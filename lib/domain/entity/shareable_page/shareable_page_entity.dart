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
  int companyId;
  String name;
  ShareablePageCreatorUserEntity({
    required this.id,
    required this.companyId,
    required this.name,
  });
}
