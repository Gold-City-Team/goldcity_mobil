import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:goldcity/config/data/remote_manager.dart';
import 'package:goldcity/data/dto/receive/education/education/education_dto.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/enum/source_path.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class EducationRemoteDataSource {
  Future<Either<BaseErrorModel, List<EducationDto>>> getEducationList();
}

class EducationRemoteDataSourceImpl extends EducationRemoteDataSource {
  @override
  Future<Either<BaseErrorModel, List<EducationDto>>> getEducationList() async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.EDUCATION_LIST.rawValue());

      return Right(
          (result.data as List).map((e) => EducationDto.fromJson(e)).toList());
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }
}
