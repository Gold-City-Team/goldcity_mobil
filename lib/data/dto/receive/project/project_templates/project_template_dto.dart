// ignore_for_file: constant_identifier_names

import 'package:goldcity/data/dto/receive/project/project_templates/project_template_eight/project_template_eight_dto.dart';
import 'package:goldcity/data/dto/receive/template/main_template_dto.dart';
import 'package:goldcity/data/dto/receive/project/project_templates/project_template_five/project_template_five_dto.dart';
import 'package:goldcity/data/dto/receive/project/project_templates/project_template_four/project_template_four_dto.dart';
import 'package:goldcity/data/dto/receive/project/project_templates/project_template_one/project_template_one_dto.dart';
import 'package:goldcity/data/dto/receive/project/project_templates/project_template_seven/project_template_seven_dto.dart';
import 'package:goldcity/data/dto/receive/project/project_templates/project_template_six/project_template_six_dto.dart';
import 'package:goldcity/data/dto/receive/project/project_templates/project_template_three/project_template_three_dto.dart';
import 'package:goldcity/data/dto/receive/project/project_templates/project_template_two/project_template_two_dto.dart';
import 'package:goldcity/domain/entity/project/project_templates/project_template_entity.dart';

class ProjectTemplateDto {
  int? id;
  TEMPLATE? type;
  dynamic template;

  ProjectTemplateDto({this.id, this.type, this.template});

  ProjectTemplateDto.fromJson(Map<String, dynamic> data) {
    id = data["id"];
    type = switch (data["template"]["type"]) {
      "PROJECT_TEMPLATE_ONE" => TEMPLATE.PROJECT_TEMPLATE_ONE,
      "PROJECT_TEMPLATE_TWO" => TEMPLATE.PROJECT_TEMPLATE_TWO,
      "PROJECT_TEMPLATE_THREE" => TEMPLATE.PROJECT_TEMPLATE_THREE,
      "PROJECT_TEMPLATE_FOUR" => TEMPLATE.PROJECT_TEMPLATE_FOUR,
      "PROJECT_TEMPLATE_FIVE" => TEMPLATE.PROJECT_TEMPLATE_FIVE,
      "PROJECT_TEMPLATE_SIX" => TEMPLATE.PROJECT_TEMPLATE_SIX,
      "PROJECT_TEMPLATE_SEVEN" => TEMPLATE.PROJECT_TEMPLATE_SEVEN,
      "PROJECT_TEMPLATE_EIGHT" => TEMPLATE.PROJECT_TEMPLATE_EIGHT,
      _ => TEMPLATE.PROJECT_TEMPLATE_ONE
    };
    switch (type) {
      case TEMPLATE.PROJECT_TEMPLATE_ONE:
        template = ProjectTemplateOneDto.fromJson(data["template"]).toEntity();
      case TEMPLATE.PROJECT_TEMPLATE_TWO:
        template = ProjectTemplateTwoDto.fromJson(data["template"]).toEntity();
      case TEMPLATE.PROJECT_TEMPLATE_THREE:
        template =
            ProjectTemplateThreeDto.fromJson(data["template"]).toEntity();
      case TEMPLATE.PROJECT_TEMPLATE_FOUR:
        template = ProjectTemplateFourDto.fromJson(data["template"]).toEntity();
      case TEMPLATE.PROJECT_TEMPLATE_FIVE:
        template = ProjectTemplateFiveDto.fromJson(data["template"]).toEntity();
      case TEMPLATE.PROJECT_TEMPLATE_SIX:
        template = ProjectTemplateSixDto.fromJson(data["template"]).toEntity();
      case TEMPLATE.PROJECT_TEMPLATE_SEVEN:
        template =
            ProjectTemplateSevenDto.fromJson(data["template"]).toEntity();
      case TEMPLATE.PROJECT_TEMPLATE_EIGHT:
        template =
            ProjectTemplateEightDto.fromJson(data["template"]).toEntity();
      default:
        template = ProjectTemplateOneDto.fromJson(data["template"]).toEntity();
    }
  }

  ProjectTemplateEntity toEntity() => ProjectTemplateEntity(
        id: id ?? 0,
        type: type ?? TEMPLATE.PROJECT_TEMPLATE_ONE,
        template: template,
      );
}
