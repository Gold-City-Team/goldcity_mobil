import 'package:either_dart/either.dart';
import 'package:goldcity/data/source/remote/news/news_remote_data_source.dart';
import 'package:goldcity/domain/entity/news/news_entity.dart';
import 'package:goldcity/domain/repository/news/news_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class NewsRepositoryImpl implements NewsRepository {
  @override
  Future<Either<BaseErrorModel, List<NewsEntity>>> getNews() async {
    var result = await locator<NewsRemoteDataSource>().getNews();
    if (result.isRight) {
      return Right(result.right.map((e) => e.toEntity()).toList());
    }
    return Left(result.left);
  }
}
