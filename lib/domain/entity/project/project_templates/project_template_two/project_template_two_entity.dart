import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/gallery_media/gallery_media_entity.dart';
import 'package:goldcity/domain/entity/media/media_entity.dart';

@immutable
class ProjectTemplateTwoEntity {
  final int id;
  final String title;
  final String description;
  final MediaEntity mediaItem;
  final List<GalleryMediaEntity> gallery;
  final TemplateTwoMetaDataEntity metaData;
  const ProjectTemplateTwoEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.mediaItem,
    required this.gallery,
    required this.metaData,
  });
}

@immutable
class TemplateTwoMetaDataEntity {
  final String mainImagePosition;
  const TemplateTwoMetaDataEntity({required this.mainImagePosition});
}
