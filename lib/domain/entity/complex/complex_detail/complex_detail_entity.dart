import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/media/media_entity.dart';
import 'package:goldcity/domain/entity/template/main_template_entity.dart';

@immutable
class ComplexDetailEntity {
  final int id;
  final String title;
  final MediaEntity mainImage;
  final MediaEntity logo;
  final List<MainTemplateEntity> templates;

  const ComplexDetailEntity({
    required this.id,
    required this.title,
    required this.mainImage,
    required this.logo,
    required this.templates,
  });
}
