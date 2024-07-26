import 'package:either_dart/either.dart';
import 'package:goldcity/domain/entity/announcement/announcement_entity.dart';
import 'package:goldcity/domain/repository/announcement/announcement_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class AnnouncementUseCase {
  Future<Either<BaseErrorModel, List<AnnouncementEntity>>>
      getAnnouncementList() async {
    return locator<AnnouncementRepository>().getAnnouncementList();
  }

  Future<Either<BaseErrorModel, AnnouncementEntity>> getAnnouncement(
      int id) async {
    return locator<AnnouncementRepository>().getAnnouncement(id);
  }
}
