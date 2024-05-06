import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/location/location_entity.dart';
import 'package:goldcity/domain/entity/media/media_entity.dart';

@immutable
class PossibilityEntity {
  final int id;
  final String title;
  final String description;
  final double color;
  final LocationEntity location;
  final MediaEntity media;

  const PossibilityEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.color,
    required this.location,
    required this.media,
  });
}
