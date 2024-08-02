import 'package:goldcity/domain/entity/media/media_entity.dart';

class LanguageDetailEntity {
  int id;
  String name;
  String code;
  MediaEntity mediaItem;
  LanguageDetailEntity({
    required this.id,
    required this.name,
    required this.code,
    required this.mediaItem,
  });
}
