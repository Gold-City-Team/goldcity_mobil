import 'package:flutter/cupertino.dart';
import 'package:goldcity/domain/entity/gallery_media/gallery_media_entity.dart';

@immutable
class ProjectTemplateEightEntity {
  final int id;
  final List<TitleDescriptionGalleriesEntity> items;
  const ProjectTemplateEightEntity({required this.id, required this.items});
}

@immutable
class TitleDescriptionGalleriesEntity {
  final int id;
  final String title;
  final String description;
  final List<GalleryMediaEntity> galleries;
  const TitleDescriptionGalleriesEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.galleries});
}
