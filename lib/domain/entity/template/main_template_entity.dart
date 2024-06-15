import 'package:flutter/material.dart';
import 'package:goldcity/data/dto/receive/template/main_template_dto.dart';

@immutable
class MainTemplateEntity {
  final int id;
  final String title;
  final TEMPLATE type;
  final MainTemplateMetaDataEntity metaData;
  const MainTemplateEntity({
    required this.title,
    required this.type,
    required this.id,
    required this.metaData,
  });
}

@immutable
class MainTemplateMetaDataEntity {
  final String viewType;
  const MainTemplateMetaDataEntity({required this.viewType});
}
