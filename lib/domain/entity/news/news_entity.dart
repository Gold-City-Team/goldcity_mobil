import 'package:goldcity/domain/entity/media/media_entity.dart';

class NewsEntity {
  int id;
  String title;
  String shortContent;
  String content;
  DateTime createdAt;
  DateTime updatedAt;
  MediaEntity media;
  NewsEntity({
    required this.id,
    required this.title,
    required this.shortContent,
    required this.createdAt,
    required this.updatedAt,
    required this.content,
    required this.media,
  });
}