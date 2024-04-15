import 'package:either_dart/either.dart';
import 'package:goldcity/config/data/local_manager.dart';
import 'package:goldcity/data/dto/receive/project/project/project_dto.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/enum/source_path.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class ProjectLocalDataSource {
  Either<BaseErrorModel, ProjectDto> getDetail(int id);
}

class ProjectLocalDataSourceImpl extends ProjectLocalDataSource {
  @override
  Either<BaseErrorModel, ProjectDto> getDetail(int id) {
    var result = locator<LocalManager>()
        .getData(key: SourcePath.PROJECT.rawValue(data: [id]));
    if (result != null) {
      var resultList = result["cachedData"] as List<dynamic>;
      var model = resultList.map((e) => ProjectDto.fromJson(e)).toList();

      return Right(model.first);
    }
    return Left(BaseErrorModel(title: "cache not found"));
  }
}
