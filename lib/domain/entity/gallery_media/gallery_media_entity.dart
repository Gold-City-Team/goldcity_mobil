import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/media/media_entity.dart';

@immutable
final class GalleryMediaEntity {
  final int id;
  final MediaEntity media;
  final GalleryMediaCategoryEntity category;
  final String title;
  final String description;

  const GalleryMediaEntity(
      {required this.id,
      required this.media,
      required this.category,
      required this.title,
      required this.description});
}

class GalleryMediaCategoryEntity {
  int id;
  GalleryMediaCategoryTranslationEntity translation;

  GalleryMediaCategoryEntity({
    required this.id,
    required this.translation,
  });
}

class GalleryMediaCategoryTranslationEntity {
  int id;
  String title;

  GalleryMediaCategoryTranslationEntity({
    required this.id,
    required this.title,
  });
}

@immutable
class TitleDescriptionGalleriesEntity {
  final int id;
  final String title;
  final String description;
  final List<GalleryMediaEntity> galleries;
  const TitleDescriptionGalleriesEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.galleries});
}
