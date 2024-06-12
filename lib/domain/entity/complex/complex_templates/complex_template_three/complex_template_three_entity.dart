import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/possibility/possibility_entity.dart';

@immutable
class ComplexTemplateThreeEntity {
  final int id;
  final LocationEntity location;
  final List<PossibilityEntity> possibilities;

  const ComplexTemplateThreeEntity({
    required this.id,
    required this.location,
    required this.possibilities,
  });
}
