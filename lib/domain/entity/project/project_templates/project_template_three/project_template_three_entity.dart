import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/media/media_entity.dart';

@immutable
class ProjectTemplateThreeEntity {
  final int id;
  final LocationEntity location;
  final List<PossibilityEntity> possibilities;

  const ProjectTemplateThreeEntity({
    required this.id,
    required this.location,
    required this.possibilities,
  });
}

@immutable
class LocationEntity {
  final int id;
  final String title;
  final double latitude;
  final double longitude;

  const LocationEntity({
    required this.id,
    required this.title,
    required this.latitude,
    required this.longitude,
  });
}

@immutable
class PossibilityEntity {
  final int id;
  final String title;
  final String description;
  final double color;
  final LocationEntity location;
  final MediaEntity media;
  final CategoryEntity category;

  const PossibilityEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.color,
    required this.location,
    required this.media,
    required this.category,
  });
}

@immutable
final class CategoryEntity {
  final int id;
  final TranslationEntity translation;

  const CategoryEntity({required this.id, required this.translation});
}

@immutable
final class TranslationEntity {
  final int id;
  final String title;

  const TranslationEntity({required this.id, required this.title});
}
