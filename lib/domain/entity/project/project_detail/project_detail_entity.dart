import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/language/language_entity.dart';

@immutable
final class ProjectDetailEntity {
  final int id;
  final String title;
  final String slogan;
  final LanguageEntity language;
  const ProjectDetailEntity(
      {required this.id,
      required this.title,
      required this.slogan,
      required this.language});
}
