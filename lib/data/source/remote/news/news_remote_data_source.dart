import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:goldcity/config/data/remote_manager.dart';
import 'package:goldcity/data/dto/receive/news/comment_dto.dart';
import 'package:goldcity/data/dto/receive/news/news_dto.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/enum/source_path.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class NewsRemoteDataSource {
  Future<Either<BaseErrorModel, List<NewsDto>>> getNews();
  Future<Either<BaseErrorModel, NewsDto>> getNewsDetail(int id);
  Future<Either<BaseErrorModel, List<CommentDto>>> getNewsComment(int id);
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

  @override
  Future<Either<BaseErrorModel, NewsDto>> getNewsDetail(int id) async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.NEWS_DETAIL.rawValue(data: [id]));

      return Right(NewsDto.fromJson(result.data));
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<Either<BaseErrorModel, List<CommentDto>>> getNewsComment(
      int id) async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.NEWS_COMMENT.rawValue(data: [id]));

      return Right(
          (result.data as List).map((e) => CommentDto.fromJson(e)).toList());
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }
}
