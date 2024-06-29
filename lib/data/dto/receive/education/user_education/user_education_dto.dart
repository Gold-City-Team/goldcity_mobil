import 'package:goldcity/data/dto/receive/education/education_detail/education_detail_dto.dart';
import 'package:goldcity/domain/entity/education/user_education/user_education_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_education_dto.g.dart';

@JsonSerializable()
class UserEducationDto {
  int? id;
  EducationDetailDto? meeting;
  String? joinUrl;
  UserEducationDto(this.id, this.meeting, this.joinUrl);

  factory UserEducationDto.fromJson(Map<String, dynamic> json) =>
      _$UserEducationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserEducationDtoToJson(this);
  UserEducationEntity toEntity() => UserEducationEntity(
      id: id ?? 0,
      educationDetail: meeting != null
          ? meeting!.toEntity()
          : EducationDetailDto().toEntity(),
      joinUrl: joinUrl ?? "");
}
