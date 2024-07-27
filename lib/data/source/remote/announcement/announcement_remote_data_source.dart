import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:goldcity/config/data/local_manager.dart';
import 'package:goldcity/config/data/remote_manager.dart';
import 'package:goldcity/data/dto/receive/announcement/announcement_dto.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/enum/source_path.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class AnnouncementRemoteDataSource {
  Future<Either<BaseErrorModel, List<AnnouncementDto>>> getAnnouncementList();
  Future<Either<BaseErrorModel, AnnouncementDto>> getAnnouncement(int id);
}

class AnnouncementRemoteDataSourceImpl extends AnnouncementRemoteDataSource {
  @override
  Future<Either<BaseErrorModel, List<AnnouncementDto>>>
      getAnnouncementList() async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.ANNOUNCEMENT_LIST.rawValue());

      locator<LocalManager>().cacheData(
          SourcePath.ANNOUNCEMENT_LIST.rawValue(),
          (result.data as List)
              .map((e) => AnnouncementDto.fromJson(e))
              .toList());

      return Right((result.data as List)
          .map((e) => AnnouncementDto.fromJson(e))
          .toList());
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<Either<BaseErrorModel, AnnouncementDto>> getAnnouncement(
      int id) async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.ANNOUNCEMENT.rawValue(data: [id]));

      locator<LocalManager>().cacheData(
          SourcePath.ANNOUNCEMENT.rawValue(data: [id]),
          [AnnouncementDto.fromJson(result.data ?? {})]);

      return Right(AnnouncementDto.fromJson(result.data));
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }
}
