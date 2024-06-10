import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/gallery_media/gallery_media_entity.dart';
import 'package:goldcity/domain/entity/media/media_entity.dart';
import 'package:goldcity/domain/entity/features/features_entity.dart';

@immutable
class TemplateFourEntity {
  final int id;
  final String title;
  final MediaEntity mediaItem;
  final List<FeaturesEntity> features;
  final List<GalleryMediaEntity> gallery;

  const TemplateFourEntity({
    required this.id,
    required this.title,
    required this.mediaItem,
    required this.features,
    required this.gallery,
  });
}
