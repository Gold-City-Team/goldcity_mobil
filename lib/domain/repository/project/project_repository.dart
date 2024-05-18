import 'package:either_dart/either.dart';
import 'package:goldcity/data/dto/receive/project/project_gallery/project_gallery_dto.dart';
import 'package:goldcity/domain/entity/project/project/project_entity.dart';
import 'package:goldcity/domain/entity/project/project_gallery/project_gallery_entity.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class ProjectRepository {
  Stream<Either<BaseErrorModel, List<ProjectEntity>>> getProjectList();
  Stream<Either<BaseErrorModel, ProjectEntity>> getDetail(int id);
  Stream<Either<BaseErrorModel, ProjectGalleryEntity>> getGallery(
      int projectId, GALLERY_TYPE type);
}
