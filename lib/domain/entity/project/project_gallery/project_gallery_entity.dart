import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/project/project_gallery_media_entity/project_gallery_media_entity.dart';

@immutable
final class ProjectGalleryEntity {
  final int id;
  final List<ProjectGalleryMediaEntity> projectGallery;
  const ProjectGalleryEntity({
    required this.id,
    required this.projectGallery,
  });
}
