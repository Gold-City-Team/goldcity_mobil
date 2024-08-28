import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:goldcity/config/data/remote_manager.dart';
import 'package:goldcity/data/dto/receive/news/news_dto.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/enum/source_path.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class NewsRemoteDataSource {
  Future<Either<BaseErrorModel, List<NewsDto>>> getNews();
}

class NewsRemoteDataSourceImpl extends NewsRemoteDataSource {
  @override
  Future<Either<BaseErrorModel, List<NewsDto>>> getNews() async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.NEWS.rawValue());

      return Right(
          (result.data as List).map((e) => NewsDto.fromJson(e)).toList());
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }
}
