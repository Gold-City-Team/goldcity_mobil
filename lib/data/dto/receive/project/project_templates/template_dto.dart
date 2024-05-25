// ignore_for_file: constant_identifier_names

import 'package:goldcity/data/dto/receive/project/project_templates/template_one/template_one_dto.dart';

enum TEMPLATE { TEMPLATE_ONE }

class TemplateDto {
  int? id;
  TEMPLATE? type;
  dynamic template;

  TemplateDto({this.id, this.type, this.template});

  toEntity(Map<String, dynamic> data) {
    type = data["template"]["type"];
    switch (type) {
      case TEMPLATE.TEMPLATE_ONE:
        template = TemplateOneDto.fromJson(data["template"]);

      case null:
    }
  }
}
