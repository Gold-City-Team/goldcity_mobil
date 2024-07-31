import 'package:goldcity/domain/entity/shareable_page/shareable_page_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shareable_page_dto.g.dart';

@JsonSerializable()
class ShareablePageDto {
  String? id;
  String? pageType;
  int? pageId;
  String? userType;
  ShareablePageCreatorUserDto? creatorUser;
  ShareablePageDto({
    required this.id,
    required this.pageType,
    required this.creatorUser,
    required this.pageId,
    required this.userType,
  });

  factory ShareablePageDto.fromJson(Map<String, dynamic> json) =>
      _$ShareablePageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ShareablePageDtoToJson(this);

  ShareablePageDto fromJson(Map<String, dynamic> json) =>
      _$ShareablePageDtoFromJson(json);

  ShareablePageEntity toEntity() => ShareablePageEntity(
        id: id ?? "",
        pageId: pageId ?? 0,
        pageType: pageType ?? "",
        userType: userType ?? "",
        creatorUser: creatorUser != null
            ? creatorUser!.toEntity()
            : ShareablePageCreatorUserDto().toEntity(),
      );
}

@JsonSerializable()
class ShareablePageCreatorUserDto {
  int? id;
  int? companyId;
  String? name;
  ShareablePageCreatorUserDto({this.id, this.companyId, this.name});
  factory ShareablePageCreatorUserDto.fromJson(Map<String, dynamic> json) =>
      _$ShareablePageCreatorUserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ShareablePageCreatorUserDtoToJson(this);

  ShareablePageCreatorUserDto fromJson(Map<String, dynamic> json) =>
      _$ShareablePageCreatorUserDtoFromJson(json);

  ShareablePageCreatorUserEntity toEntity() => ShareablePageCreatorUserEntity(
        companyId: companyId ?? 0,
        id: id ?? 0,
        name: name ?? "",
      );
}
