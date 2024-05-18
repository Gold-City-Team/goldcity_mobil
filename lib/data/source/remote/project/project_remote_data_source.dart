import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:goldcity/config/data/local_manager.dart';
import 'package:goldcity/config/data/remote_manager.dart';
import 'package:goldcity/data/dto/receive/project/project/project_dto.dart';
import 'package:goldcity/data/dto/receive/project/project_gallery/project_gallery_dto.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/enum/source_path.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class ProjectRemoteDataSource {
  Future<Either<BaseErrorModel, ProjectDto>> getDetail(int id);
  Future<Either<BaseErrorModel, ProjectGalleryDto>> getGallery(
      int projectId, GALLERY_TYPE type);
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
  Future<Either<BaseErrorModel, ProjectGalleryDto>> getGallery(
      int projectId, GALLERY_TYPE type) async {
    try {
      var result = switch (type) {
        GALLERY_TYPE.INTERIOR_GALLERY =>
          await locator<RemoteManager>().networkManager.get(
              SourcePath.PROJECT_INTERIOR_GALLERY.rawValue(data: [projectId])),
        GALLERY_TYPE.OUTDOOR_GALLERY => await locator<RemoteManager>()
            .networkManager
            .get(SourcePath.PROJECT_OUTDOOR_GALLERY.rawValue(data: [projectId]))
      };

      return Right(ProjectGalleryDto.fromJson(result.data ?? {}));
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
