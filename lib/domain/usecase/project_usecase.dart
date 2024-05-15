import 'package:either_dart/either.dart';
import 'package:goldcity/data/dto/receive/project/project_gallery/project_gallery_dto.dart';
import 'package:goldcity/domain/entity/project/project/project_entity.dart';
import 'package:goldcity/domain/entity/project/project_gallery/project_gallery_entity.dart';
import 'package:goldcity/domain/repository/project/project_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class ProjectUseCase {
  Stream<Either<BaseErrorModel, ProjectEntity>> getDetail(int id) {
    return locator<ProjectRepository>().getDetail(id);
  }

  Stream<Either<BaseErrorModel, ProjectGalleryEntity>> projectGallery(
      int projectId, GALLERY_TYPE type) {
    return locator<ProjectRepository>().getGallery(projectId, type);
  }
}
