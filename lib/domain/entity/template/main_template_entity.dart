import 'package:flutter/material.dart';
import 'package:goldcity/data/dto/receive/template/main_template_dto.dart';

@immutable
class MainTemplateEntity {
  final int id;
  final String title;
  final TEMPLATE type;

  const MainTemplateEntity(
      {required this.title, required this.type, required this.id});
}
