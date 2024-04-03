import 'package:either_dart/either.dart';
import 'package:goldcity/domain/entity/project/project_detail/project_detail_entity.dart';
import 'package:goldcity/domain/repository/project/project_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class ProjectUseCase {
  Future<Either<BaseErrorModel, ProjectDetailEntity>> getDetail(int id) {
    return locator<ProjectRepository>().getDetail(id);
  }
}
