import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/complex/complex_detail/complex_detail_entity.dart';
import 'package:goldcity/domain/entity/media/media_entity.dart';
import 'package:goldcity/domain/entity/project/language/project_language_entity.dart';

@immutable
final class ComplexEntity {
  final int id;
  final MediaEntity logo;
  final MediaEntity mainImage;
  final ComplexDetailEntity complexDetail;
  final String title;
  final List<LanguageDetailEntity> languages;

  final String slogan;
  const ComplexEntity({
    required this.id,
    required this.mainImage,
    required this.logo,
    required this.title,
    required this.languages,
    required this.slogan,
    required this.complexDetail,
  });
}
