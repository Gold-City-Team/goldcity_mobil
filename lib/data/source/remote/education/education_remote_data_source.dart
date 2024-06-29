import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:goldcity/config/data/remote_manager.dart';
import 'package:goldcity/data/dto/receive/education/education_detail/education_detail_dto.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/enum/source_path.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class EducationRemoteDataSource {
  Future<Either<BaseErrorModel, List<EducationDetailDto>>> getEducationList();
}

class EducationRemoteDataSourceImpl extends EducationRemoteDataSource {
  @override
  Future<Either<BaseErrorModel, List<EducationDetailDto>>>
      getEducationList() async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.EDUCATION.rawValue());

      return Right((result.data as List)
          .map((e) => EducationDetailDto.fromJson(e))
          .toList());
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }
}
