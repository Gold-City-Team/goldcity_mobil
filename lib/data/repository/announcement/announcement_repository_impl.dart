import 'package:either_dart/either.dart';
import 'package:goldcity/data/source/remote/announcement/announcement_remote_data_source.dart';
import 'package:goldcity/domain/entity/announcement/announcement_entity.dart';
import 'package:goldcity/domain/repository/announcement/announcement_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class AnnouncementRepositoryImpl implements AnnouncementRepository {
  @override
  Future<Either<BaseErrorModel, List<AnnouncementEntity>>>
      getAnnouncementList() async {
    var result =
        await locator<AnnouncementRemoteDataSource>().getAnnouncementList();
    if (result.isRight) {
      return Right(result.right.map((e) => e.toEntity()).toList());
    }
    return Left(result.left);
  }

  @override
  Future<Either<BaseErrorModel, AnnouncementEntity>> getAnnouncement(
      int id) async {
    var result =
        await locator<AnnouncementRemoteDataSource>().getAnnouncement(id);
    if (result.isRight) {
      return Right(result.right.toEntity());
    }
    return Left(result.left);
  }
}
