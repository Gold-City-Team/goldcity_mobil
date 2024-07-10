import 'package:either_dart/either.dart';
import 'package:goldcity/domain/entity/education/webinar_detail/education_detail_entity.dart';
import 'package:goldcity/domain/entity/education/user_webinar/user_webinar_entity.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class WebinarRepository {
  Future<Either<BaseErrorModel, List<WebinarDetailEntity>>> getWebinarList();

  Future<Either<BaseErrorModel, WebinarDetailEntity>> getWebinar(int id);
  Future<Either<BaseErrorModel, UserWebinarEntity>> getUserWebinar(int id);
  Future<BaseErrorModel?> applyWebinar(int id);
}
