import 'package:goldcity/domain/entity/gallery_media/gallery_media_entity.dart';
import 'package:goldcity/domain/entity/media/media_entity.dart';

class EducationDetailEntity {
  int id;
  String title;
  String description;
  MediaEntity mainImage;
  List<GalleryMediaEntity> educationGalleries;
  EducationDetailEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.mainImage,
    required this.educationGalleries,
  });
}
