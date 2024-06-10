// ignore_for_file: constant_identifier_names

import 'package:goldcity/domain/entity/template/main_template_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main_template_dto.g.dart';

enum TEMPLATE {
  @JsonValue("PROJECT_TEMPLATE_ONE")
  PROJECT_TEMPLATE_ONE,
  @JsonValue("PROJECT_TEMPLATE_TWO")
  PROJECT_TEMPLATE_TWO,
  @JsonValue("PROJECT_TEMPLATE_THREE")
  PROJECT_TEMPLATE_THREE,
  @JsonValue("PROJECT_TEMPLATE_FOUR")
  PROJECT_TEMPLATE_FOUR,
  @JsonValue("PROJECT_TEMPLATE_FIVE")
  PROJECT_TEMPLATE_FIVE,
  @JsonValue("PROJECT_TEMPLATE_SIX")
  PROJECT_TEMPLATE_SIX,
  @JsonValue("PROJECT_TEMPLATE_SEVEN")
  PROJECT_TEMPLATE_SEVEN,
  @JsonValue("COMPLEX_TEMPLATE_ONE")
  COMPLEX_TEMPLATE_ONE,
}

@JsonSerializable()
class MainTemplateDto {
  int? id;
  String? title;
  TEMPLATE? type;

  MainTemplateDto({this.title, this.type, this.id});

  factory MainTemplateDto.fromJson(Map<String, dynamic> json) =>
      _$MainTemplateDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MainTemplateDtoToJson(this);
  MainTemplateEntity toEntity() => MainTemplateEntity(
        id: id ?? 0,
        title: title ?? "",
        type: type ?? TEMPLATE.PROJECT_TEMPLATE_ONE,
      );
}
