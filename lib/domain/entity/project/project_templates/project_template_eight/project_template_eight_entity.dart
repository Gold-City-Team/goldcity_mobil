import 'package:flutter/cupertino.dart';
import 'package:goldcity/domain/entity/gallery_media/gallery_media_entity.dart';

@immutable
class ProjectTemplateEightEntity {
  final int id;
  final List<TitleDescriptionGalleriesEntity> items;
  const ProjectTemplateEightEntity({required this.id, required this.items});
}
