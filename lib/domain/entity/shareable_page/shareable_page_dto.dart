import 'package:json_annotation/json_annotation.dart';

part 'shareable_page_dto.g.dart';

@JsonSerializable()
class ShareablePageDto {
  int? id;
  String? pageType;
  int? pageId;
  String? userType;
  ShareablePageCreatorUserDto? creatorUser;
  ShareablePageDto(
      {this.id, this.pageType, this.creatorUser, this.pageId, this.userType});

  factory ShareablePageDto.fromJson(Map<String, dynamic> json) =>
      _$ShareablePageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ShareablePageDtoToJson(this);

  ShareablePageDto fromJson(Map<String, dynamic> json) =>
      _$ShareablePageDtoFromJson(json);
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
}
