import 'package:goldcity/domain/entity/media/media_entity.dart';

class AnnouncementEntity {
  int id;
  String title;
  String description;
  List<AnnouncementFileEntity> attachments;
  AnnouncementEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.attachments});
}

class AnnouncementFileEntity {
  int id;
  String title;
  MediaEntity file;
  AnnouncementFileEntity(
      {required this.id, required this.title, required this.file});
}
