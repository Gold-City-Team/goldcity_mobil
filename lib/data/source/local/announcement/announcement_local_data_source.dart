import 'package:either_dart/either.dart';
import 'package:goldcity/config/data/local_manager.dart';
import 'package:goldcity/data/dto/receive/announcement/announcement_dto.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/enum/source_path.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class AnnouncementLocalDataSource {
  Either<BaseErrorModel, List<AnnouncementDto>> getAnnouncementList();
  Either<BaseErrorModel, AnnouncementDto> getAnnouncement(int id);
}

class AnnouncementLocalDataSourceImpl extends AnnouncementLocalDataSource {
  @override
  Either<BaseErrorModel, AnnouncementDto> getAnnouncement(int id) {
    var result = locator<LocalManager>()
        .getData(key: SourcePath.ANNOUNCEMENT.rawValue(data: [id]));
    if (result != null) {
      var resultList = result["cachedData"] as List<dynamic>;
      var model = resultList.map((e) => AnnouncementDto.fromJson(e)).toList();

      return Right(model.first);
    }
    return Left(BaseErrorModel(title: "cache not found"));
  }

  @override
  Either<BaseErrorModel, List<AnnouncementDto>> getAnnouncementList() {
    var result = locator<LocalManager>()
        .getData(key: SourcePath.ANNOUNCEMENT_LIST.rawValue());
    if (result != null) {
      var resultList = result["cachedData"] as List<dynamic>;
      var model = resultList.map((e) => AnnouncementDto.fromJson(e)).toList();

      return Right(model);
    }
    return Left(BaseErrorModel(title: "cache not found"));
  }
}
