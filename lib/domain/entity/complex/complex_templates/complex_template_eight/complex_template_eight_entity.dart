import 'package:flutter/cupertino.dart';
import 'package:goldcity/domain/entity/gallery_media/gallery_media_entity.dart';

@immutable
class ComplexTemplateEightEntity {
  final int id;
  final List<TitleDescriptionGalleriesEntity> items;
  const ComplexTemplateEightEntity({required this.id, required this.items});
}
