// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:goldcity/data/dto/receive/template/main_template_dto.dart';

@immutable
class ProjectTemplateEntity {
  int id;
  TEMPLATE type;
  dynamic template;
  ProjectTemplateEntity(
      {required this.id, required this.type, required this.template});
}
