import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/language/language_entity.dart';
import 'package:goldcity/domain/entity/location/location_entity.dart';
import 'package:goldcity/domain/entity/media/media_entity.dart';
import 'package:goldcity/domain/entity/project/project_features/project_features_entity.dart';

@immutable
final class ProjectDetailEntity {
  final int id;
  final String title;
  final String slogan;
  final LanguageEntity language;
  final LocationEntity location;
  final MediaEntity media;
  final List<ProjectFeaturesEntity> features;
  const ProjectDetailEntity({
    required this.id,
    required this.title,
    required this.slogan,
    required this.media,
    required this.location,
    required this.language,
    required this.features,
  });
}
