import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/project/template/template_gallery/template_gallery_entity.dart';

@immutable
class TemplateFiveEntity {
  final int id;
  final String title;
  final List<TemplateGalleryEntity> gallery;

  const TemplateFiveEntity({
    required this.id,
    required this.title,
    required this.gallery,
  });
}
