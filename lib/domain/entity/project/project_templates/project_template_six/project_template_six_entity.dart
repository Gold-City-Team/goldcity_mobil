import 'package:flutter/material.dart';
import 'package:goldcity/data/dto/receive/project/project_templates/project_template_six/project_template_six_dto.dart';

@immutable
class ProjectTemplateSixEntity {
  final int id;
  final String title;
  final List<ProjectHomeEntity> homes;

  const ProjectTemplateSixEntity(
      {required this.id, required this.title, required this.homes});
}

@immutable
class ProjectHomeEntity {
  final int id;
  final String blok;
  final String no;
  final String floor;
  final String area;
  final String price;
  final String type;
  final HOME_STATE state;
  const ProjectHomeEntity({
    required this.id,
    required this.blok,
    required this.no,
    required this.floor,
    required this.area,
    required this.price,
    required this.type,
    required this.state,
  });
}
