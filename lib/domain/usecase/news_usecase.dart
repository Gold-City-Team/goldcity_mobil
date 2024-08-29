import 'package:either_dart/either.dart';
import 'package:goldcity/data/dto/send/comment/news_send_comment_dto.dart';
import 'package:goldcity/domain/entity/news/comment_entity.dart';
import 'package:goldcity/domain/entity/news/news_entity.dart';
import 'package:goldcity/domain/repository/news/news_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class NewsUseCase {
  Future<Either<BaseErrorModel, List<NewsEntity>>> getNews() async {
    return locator<NewsRepository>().getNews();
  }

  Future<Either<BaseErrorModel, NewsEntity>> getNewsDetail(int id) async {
    return locator<NewsRepository>().getNewsDetail(id);
  }

  Future<Either<BaseErrorModel, List<CommentEntity>>> getComment(int id) async {
    return locator<NewsRepository>().getNewsComment(id);
  }

  Future<BaseErrorModel?> sendComment(SendNewsCommentDto dto) async {
    return locator<NewsRepository>().SendNewsComment(dto);
  }
}
