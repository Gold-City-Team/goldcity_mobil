import 'package:goldcity/domain/entity/media/media_entity.dart';

class EducationDetailEntity {
  int id;
  String title;
  String description;
  MediaEntity mainImage;
  EducationDetailEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.mainImage,
  });
}
