import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/media/media_entity.dart';
import 'package:goldcity/domain/entity/project/project_detail/project_detail_entity.dart';

@immutable
class ProjectEntity {
  final int id;
  final MediaEntity logo;
  final MediaEntity mainImage;
  final ProjectDetailEntity detail;
  const ProjectEntity({
    required this.id,
    required this.logo,
    required this.mainImage,
    required this.detail,
  });
}
