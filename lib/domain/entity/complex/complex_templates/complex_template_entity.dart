// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:goldcity/data/dto/receive/template/main_template_dto.dart';

@immutable
class ComplexTemplateEntity {
  int id;
  TEMPLATE type;
  dynamic template;
  ComplexTemplateEntity(
      {required this.id, required this.type, required this.template});
}
