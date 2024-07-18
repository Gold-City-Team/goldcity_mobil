import 'package:either_dart/either.dart';
import 'package:goldcity/data/source/remote/project/project_remote_data_source.dart';
import 'package:goldcity/domain/entity/project/project/project_entity.dart';
import 'package:goldcity/domain/entity/project/project_language/project_language_entity.dart';
import 'package:goldcity/domain/repository/project/project_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  @override
  Stream<Either<BaseErrorModel, ProjectEntity>> getDetail(int id) async* {
    var result = await locator<ProjectRemoteDataSource>().getDetail(id);
    if (result.isRight) {
      yield Right(result.right.toEntity());
    } else {
      yield Left(result.left);
    }
  }

  @override
  Stream<Either<BaseErrorModel, List<ProjectEntity>>> getProjectList() async* {
    var result = await locator<ProjectRemoteDataSource>().getProjectList();
    if (result.isRight) {
      yield Right(result.right.map((e) => e.toEntity()).toList());
    } else {
      yield Left(result.left);
    }
  }

  @override
  Future<Either<BaseErrorModel, List<ProjectLanguageDetailEntity>>>
      getProjectLanguageList(int id) async {
    var result =
        await locator<ProjectRemoteDataSource>().getProjectLanguageList(id);
    if (result.isRight) {
      return Right(result.right.map((e) => e.toEntity()).toList());
    }
    return Left(result.left);
  }
}
