// ignore_for_file: constant_identifier_names

import 'package:goldcity/domain/entity/project/project_template/project_template_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'project_template_dto.g.dart';

enum TEMPLATE {
  @JsonValue("TEMPLATE_ONE")
  TEMPLATE_ONE,
  @JsonValue("TEMPLATE_TWO")
  TEMPLATE_TWO
}

@JsonSerializable()
class ProjectTemplateDto {
  int? id;
  String? title;
  TEMPLATE? type;

  ProjectTemplateDto({this.title, this.type, this.id});

  factory ProjectTemplateDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectTemplateDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectTemplateDtoToJson(this);
  ProjectTemplateEntity toEntity() => ProjectTemplateEntity(
        title: title ?? "",
        type: type ?? TEMPLATE.TEMPLATE_ONE,
        id: id ?? 0,
      );
}