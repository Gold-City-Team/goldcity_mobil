import 'package:goldcity/domain/entity/media/media_entity.dart';

class WebinarDetailEntity {
  int id;
  String title;
  String description;
  MediaEntity mediaItem;
  DateTime scheduledStartDate;
  bool isRegister;

  WebinarDetailEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.mediaItem,
      required this.scheduledStartDate,
      required this.isRegister});
}
