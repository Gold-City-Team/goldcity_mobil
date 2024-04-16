import 'package:either_dart/either.dart';
import 'package:goldcity/domain/entity/project/project/project_entity.dart';
import 'package:goldcity/domain/entity/project/project_gallery/project_gallery_entity.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class ProjectRepository {
  Stream<Either<BaseErrorModel, ProjectEntity>> getDetail(int id);
  Stream<Either<BaseErrorModel, List<ProjectGalleryEntity>>> getGallery(
      int projectId);
}
