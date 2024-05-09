import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/translation/translation_entity.dart';

@immutable
final class CategoryEntity {
  final int id;
  final TranslationEntity translation;

  const CategoryEntity({required this.id, required this.translation});
}
