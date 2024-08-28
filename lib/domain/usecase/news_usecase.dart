import 'package:either_dart/either.dart';
import 'package:goldcity/domain/entity/news/news_entity.dart';
import 'package:goldcity/domain/repository/news/news_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class NewsUseCase {
  Future<Either<BaseErrorModel, List<NewsEntity>>> getNews() async {
    return locator<NewsRepository>().getNews();
  }
}
