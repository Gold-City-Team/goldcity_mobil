// ignore_for_file: constant_identifier_names

import 'package:goldcity/data/dto/receive/template/main_template_dto.dart';
import 'package:goldcity/domain/entity/project/project_templates/template_entity.dart';

class TemplateDto {
  int? id;
  TEMPLATE? type;
  dynamic template;

  TemplateDto({this.id, this.type, this.template});

  TemplateDto.fromJson(Map<String, dynamic> data) {
    id = data["id"];
  }

  ProjectTemplateEntity toEntity() => ProjectTemplateEntity(
        id: id ?? 0,
        type: type ?? TEMPLATE.PROJECT_TEMPLATE_ONE,
        template: template,
      );
}
