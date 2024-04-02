import 'package:goldcity/domain/entity/language/language_entity.dart';

final class ProjectDetailEntity {
  int id;
  String title;
  String slogan;
  LanguageEntity language;
  ProjectDetailEntity(
      {required this.id,
      required this.title,
      required this.slogan,
      required this.language});
}
