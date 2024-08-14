import 'package:flutter/cupertino.dart';
import 'package:goldcity/domain/entity/gallery_media/gallery_media_entity.dart';

@immutable
class ProjectTemplateEightEntity {
  final int id;
  final List<TitleDescriptionGalleriesEntity> items;
  final ProjectTemplateEightMetaDataEntity metaData;

  const ProjectTemplateEightEntity(
      {required this.id, required this.items, required this.metaData});
}

@immutable
class ProjectTemplateEightMetaDataEntity {
  final bool isFiltered;
  const ProjectTemplateEightMetaDataEntity({required this.isFiltered});
}
