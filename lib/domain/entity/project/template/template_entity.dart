// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:goldcity/data/dto/receive/project/project_template/project_template_dto.dart';

@immutable
class TemplateEntity {
  int id;
  TEMPLATE type;
  dynamic template;
  TemplateEntity(
      {required this.id, required this.type, required this.template});
}
