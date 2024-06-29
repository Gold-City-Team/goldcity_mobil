import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:goldcity/config/data/remote_manager.dart';
import 'package:goldcity/data/dto/receive/education/education_detail/education_detail_dto.dart';
import 'package:goldcity/data/dto/receive/education/user_education/user_education_dto.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/enum/source_path.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class EducationRemoteDataSource {
  Future<Either<BaseErrorModel, List<EducationDetailDto>>> getEducationList();
  Future<Either<BaseErrorModel, EducationDetailDto>> getEducation(int id);
  Future<BaseErrorModel?> applyEducation(int meetingId);
  Future<Either<BaseErrorModel, UserEducationDto>> getUserEducation(int id);
}

class EducationRemoteDataSourceImpl extends EducationRemoteDataSource {
  @override
  Future<Either<BaseErrorModel, List<EducationDetailDto>>>
      getEducationList() async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.EDUCATION_LIST.rawValue());

      return Right((result.data as List)
          .map((e) => EducationDetailDto.fromJson(e))
          .toList());
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<Either<BaseErrorModel, EducationDetailDto>> getEducation(
      int id) async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.EDUCATION.rawValue(data: [id]));

      return Right(EducationDetailDto.fromJson(result.data));
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<BaseErrorModel?> applyEducation(int meetingId) async {
    try {
      await locator<RemoteManager>()
          .networkManager
          .post(SourcePath.USER_EDUCATION.rawValue(data: [meetingId]));

      return null;
    } on DioException catch (e) {
      return BaseErrorModel.fromJson(e.response?.data ?? {});
    }
  }

  @override
  Future<Either<BaseErrorModel, UserEducationDto>> getUserEducation(
      int id) async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.USER_EDUCATION.rawValue(data: [id]));

      return Right(UserEducationDto.fromJson(result.data));
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }
}
