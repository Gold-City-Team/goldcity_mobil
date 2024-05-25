// ignore_for_file: constant_identifier_names

import 'package:goldcity/data/dto/receive/project/project_templates/template_one/template_one_dto.dart';
import 'package:goldcity/domain/entity/project/project_template/template_entity.dart';

enum TEMPLATE { TEMPLATE_ONE }

class TemplateDto {
  int? id;
  TEMPLATE? type;
  dynamic template;

  TemplateDto({this.id, this.type, this.template});

  TemplateDto.fromJson(Map<String, dynamic> data) {
    id = data["id"];
    type = switch (data["template"]["type"]) {
      "TEMPLATE_ONE" => TEMPLATE.TEMPLATE_ONE,
      _ => TEMPLATE.TEMPLATE_ONE
    };
    switch (type) {
      case TEMPLATE.TEMPLATE_ONE:
        template = TemplateOneDto.fromJson(data["template"]).toEntity();

      case null:
    }
  }

  TemplateEntity toEntity() => TemplateEntity(
        id: id ?? 0,
        type: type ?? TEMPLATE.TEMPLATE_ONE,
        template: template,
      );
}
