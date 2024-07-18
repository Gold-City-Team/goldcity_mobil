import 'package:either_dart/either.dart';
import 'package:goldcity/domain/entity/project/project/project_entity.dart';
import 'package:goldcity/domain/entity/project/project_language/project_language_entity.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class ProjectRepository {
  Stream<Either<BaseErrorModel, List<ProjectEntity>>> getProjectList();
  Stream<Either<BaseErrorModel, ProjectEntity>> getDetail(int id);
  Future<Either<BaseErrorModel, List<ProjectLanguageDetailEntity>>>
      getProjectLanguageList(int id);
}
