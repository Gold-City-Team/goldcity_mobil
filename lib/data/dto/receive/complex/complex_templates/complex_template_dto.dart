// ignore_for_file: constant_identifier_names

import 'package:goldcity/data/dto/receive/project/project_template/project_template_dto.dart';
import 'package:goldcity/data/dto/receive/project/project_templates/template_five/template_five_dto.dart';
import 'package:goldcity/data/dto/receive/project/project_templates/template_four/template_four_dto.dart';
import 'package:goldcity/data/dto/receive/project/project_templates/template_one/template_one_dto.dart';
import 'package:goldcity/data/dto/receive/project/project_templates/template_seven/template_seven_dto.dart';
import 'package:goldcity/data/dto/receive/project/project_templates/template_six/template_six_dto.dart';
import 'package:goldcity/data/dto/receive/project/project_templates/template_three/template_three_dto.dart';
import 'package:goldcity/data/dto/receive/project/project_templates/template_two/template_two_dto.dart';
import 'package:goldcity/domain/entity/project/project_templates/template_entity.dart';

class TemplateDto {
  int? id;
  TEMPLATE? type;
  dynamic template;

  TemplateDto({this.id, this.type, this.template});

  TemplateDto.fromJson(Map<String, dynamic> data) {
    id = data["id"];
    type = switch (data["template"]["type"]) {
      "TEMPLATE_ONE" => TEMPLATE.TEMPLATE_ONE,
      "TEMPLATE_TWO" => TEMPLATE.TEMPLATE_TWO,
      "TEMPLATE_THREE" => TEMPLATE.TEMPLATE_THREE,
      "TEMPLATE_FOUR" => TEMPLATE.TEMPLATE_FOUR,
      "TEMPLATE_FIVE" => TEMPLATE.TEMPLATE_FIVE,
      "TEMPLATE_SIX" => TEMPLATE.TEMPLATE_SIX,
      "TEMPLATE_SEVEN" => TEMPLATE.TEMPLATE_SEVEN,
      _ => TEMPLATE.TEMPLATE_ONE
    };
    switch (type) {
      case TEMPLATE.TEMPLATE_ONE:
        template = TemplateOneDto.fromJson(data["template"]).toEntity();
      case TEMPLATE.TEMPLATE_TWO:
        template = TemplateTwoDto.fromJson(data["template"]).toEntity();
      case TEMPLATE.TEMPLATE_THREE:
        template = TemplateThreeDto.fromJson(data["template"]).toEntity();
      case TEMPLATE.TEMPLATE_FOUR:
        template = TemplateFourDto.fromJson(data["template"]).toEntity();
      case TEMPLATE.TEMPLATE_FIVE:
        template = TemplateFiveDto.fromJson(data["template"]).toEntity();
      case TEMPLATE.TEMPLATE_SIX:
        template = TemplateSixDto.fromJson(data["template"]).toEntity();
      case TEMPLATE.TEMPLATE_SEVEN:
        template = TemplateSevenDto.fromJson(data["template"]).toEntity();
      case null:
    }
  }

  TemplateEntity toEntity() => TemplateEntity(
        id: id ?? 0,
        type: type ?? TEMPLATE.TEMPLATE_ONE,
        template: template,
      );
}
