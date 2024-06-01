import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/media/media_entity.dart';

@immutable
class TemplateGalleryEntity {
  final int id;
  final MediaEntity mediaItem;
  final TemplateGalleryCategoryEntity galleryCategoryEntity;
  const TemplateGalleryEntity({
    required this.id,
    required this.mediaItem,
    required this.galleryCategoryEntity,
  });
}

class TemplateGalleryCategoryEntity {
  int? id;
  TemplateGalleryCategoryTranslationEntity? translations;
  TemplateGalleryCategoryEntity({required this.id, required this.translations});
}

class TemplateGalleryCategoryTranslationEntity {
  int? languageId;
  String? title;

  TemplateGalleryCategoryTranslationEntity(
      {required this.languageId, required this.title});
}
