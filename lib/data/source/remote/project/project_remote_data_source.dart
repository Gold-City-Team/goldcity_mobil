import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:goldcity/config/data/local_manager.dart';
import 'package:goldcity/config/data/remote_manager.dart';
import 'package:goldcity/data/dto/receive/project/project/project_dto.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/enum/source_path.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class ProjectRemoteDataSource {
  Future<Either<BaseErrorModel, ProjectDto>> getDetail(int id);

  Future<Either<BaseErrorModel, List<ProjectDto>>> getProjectList();
}

class ProjectRemoteDataSourceImpl extends ProjectRemoteDataSource {
  @override
  Future<Either<BaseErrorModel, ProjectDto>> getDetail(int id) async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.PROJECT.rawValue(data: [id]));

      locator<LocalManager>().cacheData(SourcePath.PROJECT.rawValue(data: [id]),
          [ProjectDto.fromJson(result.data ?? {})]);

      return Right(ProjectDto.fromJson(result.data ?? {}));
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<Either<BaseErrorModel, List<ProjectDto>>> getProjectList() async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.PROJECT_LIST.rawValue());

      locator<LocalManager>().cacheData(SourcePath.PROJECT_LIST.rawValue(),
          (result.data as List).map((e) => ProjectDto.fromJson(e)).toList());

      return Right(
          (result.data as List).map((e) => ProjectDto.fromJson(e)).toList());
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }
}
