import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:goldcity/config/data/remote_manager.dart';
import 'package:goldcity/data/dto/receive/complex/complex_templates/complex_template_dto.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/enum/source_path.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class ComplexDetailRemoteDataSource {
  Future<Either<BaseErrorModel, ComplexTemplateDto>> getComplexTemplateDetail(
    int complexDetailId,
  );
}

class ComplexDetailRemoteDataSourceImpl extends ComplexDetailRemoteDataSource {
  @override
  Future<Either<BaseErrorModel, ComplexTemplateDto>> getComplexTemplateDetail(
      int complexDetailId) async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.COMPLEX_TEMPLATE_DETAIL.rawValue(data: [
            complexDetailId,
          ]));

      return Right(ComplexTemplateDto.fromJson(result.data ?? {}));
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }
}
