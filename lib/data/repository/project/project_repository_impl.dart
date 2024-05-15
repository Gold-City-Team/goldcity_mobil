import 'package:either_dart/either.dart';
import 'package:goldcity/data/dto/receive/project/project_gallery/project_gallery_dto.dart';
import 'package:goldcity/data/source/local/project/project_local_data_source.dart';
import 'package:goldcity/data/source/remote/project/project_remote_data_source.dart';
import 'package:goldcity/domain/entity/project/project/project_entity.dart';
import 'package:goldcity/domain/entity/project/project_gallery/project_gallery_entity.dart';
import 'package:goldcity/domain/repository/project/project_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  @override
  Stream<Either<BaseErrorModel, ProjectEntity>> getDetail(int id) async* {
    var localResult = locator<ProjectLocalDataSource>().getDetail(id);
    if (localResult.isRight) {
      yield Right(localResult.right.toEntity());
    }

    var result = await locator<ProjectRemoteDataSource>().getDetail(id);
    if (result.isRight) {
      yield Right(result.right.toEntity());
    } else {
      yield Left(result.left);
    }
  }

  @override
  Stream<Either<BaseErrorModel, ProjectGalleryEntity>> getGallery(
      int projectId, GALLERY_TYPE type) async* {
    var result =
        await locator<ProjectRemoteDataSource>().getGallery(projectId, type);
    if (result.isRight) {
      yield Right(result.right.toEntity());
    } else {
      yield Left(result.left);
    }
  }
}
