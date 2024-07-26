import 'package:either_dart/either.dart';
import 'package:goldcity/domain/entity/announcement/announcement_entity.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class AnnouncementRepository {
  Future<Either<BaseErrorModel, List<AnnouncementEntity>>>
      getAnnouncementList();
  Future<Either<BaseErrorModel, AnnouncementEntity>> getAnnouncement(int id);
}
