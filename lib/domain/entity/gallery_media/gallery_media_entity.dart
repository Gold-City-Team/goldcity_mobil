import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/media/media_entity.dart';

@immutable
final class GalleryMediaEntity {
  final int id;
  final MediaEntity media;
  final GalleryMediaCategoryEntity category;

  const GalleryMediaEntity(
      {required this.id, required this.media, required this.category});
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
