// ignore_for_file: constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'project_template_dto.g.dart';

enum COMPLEX_TEMPLATE {
  @JsonValue("TEMPLATE_ONE")
  TEMPLATE_ONE,
  @JsonValue("TEMPLATE_TWO")
  TEMPLATE_TWO
}

@JsonSerializable()
class ComplexTemplateDto {
  int? id;
  String? title;
  COMPLEX_TEMPLATE? type;

  ComplexTemplateDto({this.title, this.type, this.id});

  factory ComplexTemplateDto.fromJson(Map<String, dynamic> json) =>
      _$ComplexTemplateDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ComplexTemplateDtoToJson(this);
}
