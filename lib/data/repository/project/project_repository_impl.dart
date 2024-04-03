import 'package:either_dart/either.dart';
import 'package:goldcity/data/source/remote/project/project_remote_data_source.dart';
import 'package:goldcity/domain/entity/project/project/project_entity.dart';
import 'package:goldcity/domain/repository/project/project_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  @override
  Future<Either<BaseErrorModel, ProjectEntity>> getDetail(int id) async {
    var result = await locator<ProjectRemoteDataSource>().getDetail(id);
    if (result.isRight) {
      return Right(result.right.toEntity());
    }
    return Left(result.left);
  }
}
