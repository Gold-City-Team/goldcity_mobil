import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/location/location_entity.dart';
import 'package:goldcity/domain/entity/possibility/possibility_entity.dart';

@immutable
class ProjectPossibilityEntity {
  final int id;
  final LocationEntity location;
  final List<PossibilityEntity> possibilities;

  const ProjectPossibilityEntity({
    required this.id,
    required this.location,
    required this.possibilities,
  });
}
