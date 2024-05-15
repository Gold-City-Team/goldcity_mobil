// ignore_for_file: camel_case_types

import 'package:goldcity/domain/entity/project/project_button/project_button_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'project_button_dto.g.dart';

enum PROJECT_BUTTON_TYPE {
  INTERIOR_GALLERY,
  OUTDOOR_GALLERY,
  POSSIBILITY,
  AWARD
}

@JsonSerializable()
class ProjectButtonDto {
  String? title;
  PROJECT_BUTTON_TYPE? type;

  ProjectButtonDto({this.title, this.type});

  factory ProjectButtonDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectButtonDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectButtonDtoToJson(this);

  ProjectButtonEntity toEntity() => ProjectButtonEntity(
      title: title ?? "", type: type ?? PROJECT_BUTTON_TYPE.INTERIOR_GALLERY);
}
