import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/media/media_entity.dart';

@immutable
class TemplateGalleryEntity {
  final int id;
  final MediaEntity mediaItem;
  const TemplateGalleryEntity({
    required this.id,
    required this.mediaItem,
  });
}
