// ignore_for_file: constant_identifier_names

import 'package:goldcity/data/dto/receive/complex/complex_templates/complex_template_one/complex_template_one_dto.dart';
import 'package:goldcity/data/dto/receive/complex/complex_templates/complex_template_three/complex_template_three_dto.dart';
import 'package:goldcity/data/dto/receive/complex/complex_templates/complex_template_two/complex_template_two_dto.dart';
import 'package:goldcity/data/dto/receive/template/main_template_dto.dart';
import 'package:goldcity/domain/entity/complex/complex_templates/complex_template_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'complex_template_dto.g.dart';

@JsonSerializable()
class ComplexTemplateDto {
  int? id;
  TEMPLATE? type;
  dynamic template;

  ComplexTemplateDto({this.id, this.type, this.template});

  ComplexTemplateDto.fromJson(Map<String, dynamic> data) {
    id = data["id"];
    type = switch (data["template"]["type"]) {
      "COMPLEX_TEMPLATE_ONE" => TEMPLATE.COMPLEX_TEMPLATE_ONE,
      "COMPLEX_TEMPLATE_TWO" => TEMPLATE.COMPLEX_TEMPLATE_TWO,
      "COMPLEX_TEMPLATE_THREE" => TEMPLATE.COMPLEX_TEMPLATE_THREE,
      "COMPLEX_TEMPLATE_FOUR" => TEMPLATE.COMPLEX_TEMPLATE_FOUR,
      _ => TEMPLATE.COMPLEX_TEMPLATE_ONE
    };
    switch (type) {
      case TEMPLATE.COMPLEX_TEMPLATE_ONE:
        template = ComplexTemplateOneDto.fromJson(data["template"]).toEntity();
      case TEMPLATE.COMPLEX_TEMPLATE_TWO:
        template = ComplexTemplateTwoDto.fromJson(data["template"]).toEntity();
      case TEMPLATE.COMPLEX_TEMPLATE_THREE:
        template =
            ComplexTemplateThreeDto.fromJson(data["template"]).toEntity();
      case TEMPLATE.COMPLEX_TEMPLATE_FOUR:
        template = ComplexTemplateTwoDto.fromJson(data["template"]).toEntity();
      default:
        template = ComplexTemplateOneDto.fromJson(data["template"]).toEntity();
    }
  }

  ComplexTemplateEntity toEntity() => ComplexTemplateEntity(
        id: id ?? 0,
        type: type ?? TEMPLATE.COMPLEX_TEMPLATE_ONE,
        template: template,
      );
}
