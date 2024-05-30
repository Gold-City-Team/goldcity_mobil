import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:goldcity/config/data/remote_manager.dart';
import 'package:goldcity/data/dto/receive/project/project_templates/template_dto.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/enum/source_path.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class ProjectDetailRemoteDataSource {
  Future<Either<BaseErrorModel, TemplateDto>> getProjectTemplateDetail(
      int projectDetailId, int settingsId);
}

class ProjectDetailRemoteDataSourceImpl extends ProjectDetailRemoteDataSource {
  @override
  Future<Either<BaseErrorModel, TemplateDto>> getProjectTemplateDetail(
      int projectDetailId, int settingsId) async {
    try {
      var result = await locator<RemoteManager>().networkManager.get(SourcePath
          .PROJECT_TEMPLATE_DETAIL
          .rawValue(data: [projectDetailId, settingsId]));

      return Right(TemplateDto.fromJson(result.data ?? {}));
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }
}
