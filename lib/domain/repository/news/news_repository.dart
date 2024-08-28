import 'package:either_dart/either.dart';
import 'package:goldcity/domain/entity/news/news_entity.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class NewsRepository {
  Future<Either<BaseErrorModel, List<NewsEntity>>> getNews();
}
