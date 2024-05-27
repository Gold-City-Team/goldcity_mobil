import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/media/media_entity.dart';

@immutable
class TemplateTwoEntity {
  final int id;
  final String title;
  final String subTitle;
  final String description;
  final MediaEntity mediaItem;
  final List<TemplateTwoGalleryEntity> gallery;
  const TemplateTwoEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.mediaItem,
    required this.gallery,
    required this.subTitle,
  });
}

@immutable
class TemplateTwoGalleryEntity {
  final int id;
  final MediaEntity mediaItem;
  const TemplateTwoGalleryEntity({
    required this.id,
    required this.mediaItem,
  });
}
