import 'package:goldcity/data/dto/receive/education/webinar_detail/webinar_detail_dto.dart';
import 'package:goldcity/domain/entity/education/user_webinar/user_webinar_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_webinar_dto.g.dart';

@JsonSerializable()
class UserWebinarDto {
  int? id;
  WebinarDetailDto? meeting;
  String? joinUrl;
  UserWebinarDto(this.id, this.meeting, this.joinUrl);

  factory UserWebinarDto.fromJson(Map<String, dynamic> json) =>
      _$UserWebinarDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserWebinarDtoToJson(this);
  UserWebinarEntity toEntity() => UserWebinarEntity(
      id: id ?? 0,
      educationDetail:
          meeting != null ? meeting!.toEntity() : WebinarDetailDto().toEntity(),
      joinUrl: joinUrl ?? "");
}
