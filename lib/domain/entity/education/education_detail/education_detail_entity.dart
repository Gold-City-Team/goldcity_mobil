import 'package:goldcity/domain/entity/media/media_entity.dart';

class EducationDetailEntity {
  int id;
  String title;
  String description;
  MediaEntity mediaItem;
  DateTime scheduledStartDate;

  EducationDetailEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.mediaItem,
    required this.scheduledStartDate,
  });
}
