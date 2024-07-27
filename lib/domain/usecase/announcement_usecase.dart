import 'package:either_dart/either.dart';
import 'package:goldcity/domain/entity/announcement/announcement_entity.dart';
import 'package:goldcity/domain/repository/announcement/announcement_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class AnnouncementUseCase {
  Stream<Either<BaseErrorModel, List<AnnouncementEntity>>>
      getAnnouncementList() {
    return locator<AnnouncementRepository>().getAnnouncementList();
  }

  Stream<Either<BaseErrorModel, AnnouncementEntity>> getAnnouncement(int id) {
    return locator<AnnouncementRepository>().getAnnouncement(id);
  }
}
