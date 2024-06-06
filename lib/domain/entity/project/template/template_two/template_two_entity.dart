import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/media/media_entity.dart';
import 'package:goldcity/domain/entity/project/template/template_gallery/template_gallery_entity.dart';

@immutable
class TemplateTwoEntity {
  final int id;
  final String title;
  final String subTitle;
  final String description;
  final MediaEntity mediaItem;
  final List<TemplateGalleryEntity> gallery;
  final TemplateTwoMetaDataEntity metaData;
  const TemplateTwoEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.mediaItem,
    required this.gallery,
    required this.subTitle,
    required this.metaData,
  });
}

@immutable
class TemplateTwoMetaDataEntity {
  final String mainImagePosition;
  const TemplateTwoMetaDataEntity({required this.mainImagePosition});
}
