import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/media/media_entity.dart';

@immutable
class TemplateGalleryEntity {
  final int id;
  final MediaEntity mediaItem;
  final String title;
  final TemplateGalleryCategoryEntity galleryCategoryEntity;
  const TemplateGalleryEntity({
    required this.id,
    required this.mediaItem,
    required this.title,
    required this.galleryCategoryEntity,
  });
}

class TemplateGalleryCategoryEntity {
  int id;
  TemplateGalleryCategoryTranslationEntity translations;
  TemplateGalleryCategoryEntity({required this.id, required this.translations});
}

class TemplateGalleryCategoryTranslationEntity {
  int languageId;
  String title;

  TemplateGalleryCategoryTranslationEntity(
      {required this.languageId, required this.title});
}
