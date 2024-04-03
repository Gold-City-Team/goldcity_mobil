import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:goldcity/config/data/remote_manager.dart';
import 'package:goldcity/data/dto/receive/project/project_detail/project_detail_dto.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/enum/source_path.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class ProjectRemoteDataSource {
  Future<Either<BaseErrorModel, ProjectDetailDto>> getDetail(int id);
}

class ProjectRemoteDataSourceImpl extends ProjectRemoteDataSource {
  @override
  Future<Either<BaseErrorModel, ProjectDetailDto>> getDetail(int id) async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.LEAD.rawValue(data: [id]));

      return Right(result.data ?? {});
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }
}
