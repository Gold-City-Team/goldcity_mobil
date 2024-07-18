import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/template/main_template_entity.dart';

@immutable
final class ProjectDetailEntity {
  final int id;
  final String title;
  final String slogan;
  final List<MainTemplateEntity> template;

  const ProjectDetailEntity({
    required this.id,
    required this.title,
    required this.slogan,
    required this.template,
  });
}
