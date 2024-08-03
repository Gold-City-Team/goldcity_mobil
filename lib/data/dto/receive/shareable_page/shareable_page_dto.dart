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
  ShareablePageCreatorUserCompanyDto? company;
  String? name;
  String? email;
  String? tel;
  ShareablePageCreatorUserDto({this.id, this.company, this.name});
  factory ShareablePageCreatorUserDto.fromJson(Map<String, dynamic> json) =>
      _$ShareablePageCreatorUserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ShareablePageCreatorUserDtoToJson(this);

  ShareablePageCreatorUserDto fromJson(Map<String, dynamic> json) =>
      _$ShareablePageCreatorUserDtoFromJson(json);

  ShareablePageCreatorUserEntity toEntity() => ShareablePageCreatorUserEntity(
      company: company != null
          ? company!.toEntity()
          : ShareablePageCreatorUserCompanyDto().toEntity(),
      id: id ?? 0,
      name: name ?? "",
      email: email ?? "",
      tel: tel ?? "");
}

@JsonSerializable()
class ShareablePageCreatorUserCompanyDto {
  int? id;
  String? name;
  String? tel;
  ShareablePageCreatorUserCompanyDto({
    this.id,
    this.name,
    this.tel,
  });

  factory ShareablePageCreatorUserCompanyDto.fromJson(
          Map<String, dynamic> json) =>
      _$ShareablePageCreatorUserCompanyDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ShareablePageCreatorUserCompanyDtoToJson(this);

  ShareablePageCreatorUserCompanyDto fromJson(Map<String, dynamic> json) =>
      _$ShareablePageCreatorUserCompanyDtoFromJson(json);

  ShareablePageCreatorUserCompanyEntity toEntity() =>
      ShareablePageCreatorUserCompanyEntity(
        id: id ?? 0,
        name: name ?? "",
        tel: tel ?? "",
      );
}
