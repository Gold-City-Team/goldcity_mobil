import 'package:either_dart/either.dart';
import 'package:goldcity/domain/entity/education/education/education_entity.dart';
import 'package:goldcity/domain/entity/gallery_media/gallery_media_entity.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class EducationRepository {
  Future<Either<BaseErrorModel, List<EducationEntity>>> getEducationList();
  Future<Either<BaseErrorModel, EducationEntity>> getEducation(int id);
  Future<Either<BaseErrorModel, GalleryMediaEntity>> getEducationVideo(int id);
}
