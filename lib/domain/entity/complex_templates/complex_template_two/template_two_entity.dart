import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/gallery_media/gallery_media_entity.dart';
import 'package:goldcity/domain/entity/media/media_entity.dart';

@immutable
class ComplexTemplateTwoEntity {
  final int id;
  final String title;
  final String subTitle;
  final String description;
  final MediaEntity mediaItem;
  final List<GalleryMediaEntity> gallery;
  final ComplexTemplateTwoMetaDataEntity metaData;
  const ComplexTemplateTwoEntity({
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
class ComplexTemplateTwoMetaDataEntity {
  final String mainImagePosition;
  const ComplexTemplateTwoMetaDataEntity({required this.mainImagePosition});
}
