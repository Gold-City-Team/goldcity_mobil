import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/possibility/possibility_entity.dart';

@immutable
class ProjectTemplateThreeEntity {
  final int id;
  final LocationEntity location;
  final List<PossibilityEntity> possibilities;

  const ProjectTemplateThreeEntity({
    required this.id,
    required this.location,
    required this.possibilities,
  });
}
