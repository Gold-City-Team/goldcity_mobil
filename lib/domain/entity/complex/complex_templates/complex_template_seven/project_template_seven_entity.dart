import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/gallery_media/gallery_media_entity.dart';
import 'package:goldcity/domain/entity/media/media_entity.dart';

@immutable
class ComplexTemplateSevenEntity {
  final int id;
  final String title;
  final String description;
  final MediaEntity mediaItem;
  final List<GalleryMediaEntity> galleries;
  final List<GalleryMediaEntity> verticalGalleries;

  const ComplexTemplateSevenEntity({
    required this.id,
    required this.title,
    required this.galleries,
    required this.verticalGalleries,
    required this.description,
    required this.mediaItem,
  });
}
