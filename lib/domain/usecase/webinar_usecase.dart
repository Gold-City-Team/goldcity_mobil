import 'package:either_dart/either.dart';
import 'package:goldcity/domain/entity/webinar/webinar_detail/education_detail_entity.dart';
import 'package:goldcity/domain/entity/webinar/user_webinar/user_webinar_entity.dart';
import 'package:goldcity/domain/repository/webinar/webinar_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class WebinarUseCase {
  Future<Either<BaseErrorModel, List<WebinarDetailEntity>>> getWebinarList() {
    return locator<WebinarRepository>().getWebinarList();
  }

  Future<Either<BaseErrorModel, WebinarDetailEntity>> getWebinar(int id) {
    return locator<WebinarRepository>().getWebinar(id);
  }

  Future<BaseErrorModel?> applyWebinar(int id) {
    return locator<WebinarRepository>().applyWebinar(id);
  }

  Future<Either<BaseErrorModel, UserWebinarEntity>> getUserWebinar(int id) {
    return locator<WebinarRepository>().getUserWebinar(id);
  }
}
