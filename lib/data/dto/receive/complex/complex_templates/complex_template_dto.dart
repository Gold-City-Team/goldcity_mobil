// ignore_for_file: constant_identifier_names

import 'package:goldcity/data/dto/receive/template/main_template_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'complex_template_dto.g.dart';

@JsonSerializable()
class ComplexTemplateDto {
  int? id;
  String? title;
  TEMPLATE? type;

  ComplexTemplateDto({this.title, this.type, this.id});

  factory ComplexTemplateDto.fromJson(Map<String, dynamic> json) =>
      _$ComplexTemplateDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ComplexTemplateDtoToJson(this);
}
