import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/media/media_entity.dart';
import 'package:goldcity/domain/entity/features/features_entity.dart';

@immutable
class ProjectTemplateOneEntity {
  final int id;
  final String title;
  final String description;
  final MediaEntity mediaItem;
  final List<FeaturesEntity> features;
  const ProjectTemplateOneEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.mediaItem,
    required this.features,
  });
}