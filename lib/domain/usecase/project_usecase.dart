import 'package:either_dart/either.dart';
import 'package:goldcity/domain/entity/project/project/project_entity.dart';
import 'package:goldcity/domain/entity/project/project_language/project_language_entity.dart';
import 'package:goldcity/domain/repository/project/project_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class ProjectUseCase {
  Stream<Either<BaseErrorModel, ProjectEntity>> getDetail(int id) {
    return locator<ProjectRepository>().getDetail(id);
  }

  Future<Either<BaseErrorModel, List<ProjectLanguageDetailEntity>>>
      getProjectLanguageList(int id) {
    return locator<ProjectRepository>().getProjectLanguageList(id);
  }

  Stream<Either<BaseErrorModel, List<ProjectEntity>>> getProjectList() {
    return locator<ProjectRepository>().getProjectList();
  }
}
