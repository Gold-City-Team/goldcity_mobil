import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/gallery_media/gallery_media_entity.dart';

@immutable
class ComplexTemplateFiveEntity {
  final int id;
  final String title;
  final List<GalleryMediaEntity> gallery;

  const ComplexTemplateFiveEntity({
    required this.id,
    required this.title,
    required this.gallery,
  });
}
