import 'package:either_dart/either.dart';
import 'package:goldcity/data/source/remote/webinar/webinar_remote_data_source.dart';
import 'package:goldcity/domain/entity/webinar/webinar_detail/education_detail_entity.dart';
import 'package:goldcity/domain/entity/webinar/user_webinar/user_webinar_entity.dart';
import 'package:goldcity/domain/repository/webinar/webinar_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class WebinarRepositoryImpl implements WebinarRepository {
  @override
  Future<Either<BaseErrorModel, List<WebinarDetailEntity>>>
      getWebinarList() async {
    var result = await locator<WebinarRemoteDataSource>().getWebinarList();
    if (result.isRight) {
      return Right(result.right.map((e) => e.toEntity()).toList());
    }
    return Left(result.left);
  }

  @override
  Future<Either<BaseErrorModel, WebinarDetailEntity>> getWebinar(int id) async {
    var result = await locator<WebinarRemoteDataSource>().getWebinar(id);
    if (result.isRight) {
      return Right(result.right.toEntity());
    }
    return Left(result.left);
  }

  @override
  Future<BaseErrorModel?> applyWebinar(int meetingId) async {
    return await locator<WebinarRemoteDataSource>().applyWebinar(meetingId);
  }

  @override
  Future<Either<BaseErrorModel, UserWebinarEntity>> getUserWebinar(
      int id) async {
    var result = await locator<WebinarRemoteDataSource>().getUserWebinar(id);
    if (result.isRight) {
      return Right(result.right.toEntity());
    }
    return Left(result.left);
  }
}
