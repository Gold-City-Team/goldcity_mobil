import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/media/media_entity.dart';
import 'package:goldcity/domain/entity/project/project_features/project_features_entity.dart';
import 'package:goldcity/domain/entity/project/template/template_gallery/template_gallery_entity.dart';

@immutable
class TemplateFourEntity {
  final int id;
  final String title;
  final MediaEntity mediaItem;
  final List<ProjectFeaturesEntity> features;
  final List<TemplateGalleryEntity> gallery;

  const TemplateFourEntity({
    required this.id,
    required this.title,
    required this.mediaItem,
    required this.features,
    required this.gallery,
  });
}
