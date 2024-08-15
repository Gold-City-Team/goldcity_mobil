import 'package:flutter/material.dart';
import 'package:goldcity/data/dto/receive/project/project_templates/project_template_six/project_template_six_dto.dart';
import 'package:goldcity/domain/entity/gallery_media/gallery_media_entity.dart';

@immutable
class ProjectTemplateSixEntity {
  final int id;
  final List<GalleryMediaEntity> gallery;
  final List<ProjectHomeEntity> homes;

  const ProjectTemplateSixEntity(
      {required this.id, required this.gallery, required this.homes});
}

@immutable
class ProjectHomeEntity {
  final int id;
  final String block;
  final String number;
  final String floor;
  final String area;
  final String price;
  final String roomSize;
  final String homeType;
  final HOME_STATE saleState;
  final List<GalleryMediaEntity> imageGalleries;
  final List<GalleryMediaEntity> videoGalleries;
  const ProjectHomeEntity({
    required this.id,
    required this.block,
    required this.number,
    required this.floor,
    required this.roomSize,
    required this.area,
    required this.price,
    required this.homeType,
    required this.saleState,
    required this.imageGalleries,
    required this.videoGalleries,
  });
}
