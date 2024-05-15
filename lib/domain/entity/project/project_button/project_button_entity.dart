import 'package:flutter/material.dart';
import 'package:goldcity/data/dto/receive/project/project_button/project_button_dto.dart';

@immutable
class ProjectButtonEntity {
  final String title;
  final PROJECT_BUTTON_TYPE type;
  const ProjectButtonEntity({required this.title, required this.type});
}
