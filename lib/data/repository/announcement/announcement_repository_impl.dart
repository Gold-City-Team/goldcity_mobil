import 'package:either_dart/either.dart';
import 'package:goldcity/data/source/local/announcement/announcement_local_data_source.dart';
import 'package:goldcity/data/source/remote/announcement/announcement_remote_data_source.dart';
import 'package:goldcity/domain/entity/announcement/announcement_entity.dart';
import 'package:goldcity/domain/repository/announcement/announcement_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class AnnouncementRepositoryImpl implements AnnouncementRepository {
  @override
  Stream<Either<BaseErrorModel, List<AnnouncementEntity>>>
      getAnnouncementList() async* {
    var local = locator<AnnouncementLocalDataSource>().getAnnouncementList();
    if (local.isRight) {
      yield Right(local.right.map((e) => e.toEntity()).toList());
    }

    var result =
        await locator<AnnouncementRemoteDataSource>().getAnnouncementList();
    if (result.isRight) {
      yield Right(result.right.map((e) => e.toEntity()).toList());
    } else {
      yield Left(result.left);
    }
  }

  @override
  Stream<Either<BaseErrorModel, AnnouncementEntity>> getAnnouncement(
      int id) async* {
    var local = locator<AnnouncementLocalDataSource>().getAnnouncement(id);
    if (local.isRight) {
      yield Right(local.right.toEntity());
    }

    var result =
        await locator<AnnouncementRemoteDataSource>().getAnnouncement(id);
    if (result.isRight) {
      yield Right(result.right.toEntity());
    } else {
      yield Left(result.left);
    }
  }
}
