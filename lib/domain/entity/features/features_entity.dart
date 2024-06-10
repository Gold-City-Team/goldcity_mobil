import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/media/media_entity.dart';

@immutable
class FeaturesEntity {
  final int id;
  final String title;
  final String value;
  final MediaEntity media;
  const FeaturesEntity({
    required this.id,
    required this.title,
    required this.value,
    required this.media,
  });
}
