import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/project/project_detail/project_detail_entity.dart';

@immutable
class ProjectEntity {
  final int id;
  final ProjectDetailEntity detail;
  const ProjectEntity({required this.id, required this.detail});
}
