import 'package:json_annotation/json_annotation.dart';
part 'create_shareable_link_dto.g.dart';

@JsonSerializable()
class CreateShareableLinkDto {
  String? pageType;
  int? pageId;
  CreateShareableLinkDto({this.pageType, this.pageId});
  factory CreateShareableLinkDto.fromJson(Map<String, dynamic> json) =>
      _$CreateShareableLinkDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateShareableLinkDtoToJson(this);

  CreateShareableLinkDto fromJson(Map<String, dynamic> json) =>
      _$CreateShareableLinkDtoFromJson(json);
}
