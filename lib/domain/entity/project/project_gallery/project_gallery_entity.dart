import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/media/media_entity.dart';

@immutable
final class ProjectGalleryEntity {
  final int id;
  final MediaEntity media;
  final String title;
  final String description;
  const ProjectGalleryEntity({
    required this.id,
    required this.media,
    required this.title,
    required this.description,
  });
}
