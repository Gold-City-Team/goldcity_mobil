import 'package:flutter/material.dart';
import 'package:goldcity/data/dto/receive/project/project_template/project_template_dto.dart';

@immutable
class ProjectTemplateEntity {
  final int id;
  final String title;
  final TEMPLATE type;

  const ProjectTemplateEntity(
      {required this.title, required this.type, required this.id});
}
