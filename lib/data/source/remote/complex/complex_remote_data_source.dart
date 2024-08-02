import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:goldcity/config/data/remote_manager.dart';
import 'package:goldcity/data/dto/receive/complex/complex/complex_dto.dart';
import 'package:goldcity/data/dto/receive/language_detail/language_detail_dto.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/enum/source_path.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class ComplexRemoteDataSource {
  Future<Either<BaseErrorModel, List<ComplexDto>>> getComplexList();
  Future<Either<BaseErrorModel, ComplexDto>> getDetail(int id, int languageId);
  Future<Either<BaseErrorModel, List<LanguageDetailDto>>>
      getComplexLanguageList(int id);
}

class ComplexRemoteDataSourceImpl extends ComplexRemoteDataSource {
  @override
  Future<Either<BaseErrorModel, List<ComplexDto>>> getComplexList() async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.COMPLEX_LIST.rawValue());

      return Right(
          (result.data as List).map((e) => ComplexDto.fromJson(e)).toList());
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<Either<BaseErrorModel, ComplexDto>> getDetail(
      int id, int languageId) async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.COMPLEX.rawValue(data: [id, languageId]));

      return Right(ComplexDto.fromJson(result.data ?? {}));
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<Either<BaseErrorModel, List<LanguageDetailDto>>>
      getComplexLanguageList(int id) async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.COMPLEX_LANGUAGE_LIST.rawValue(data: [id]));

      return Right((result.data as List)
          .map((e) => LanguageDetailDto.fromJson(e))
          .toList());
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }
}
