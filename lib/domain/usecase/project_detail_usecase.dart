import 'package:either_dart/either.dart';
import 'package:goldcity/domain/entity/project/template/template_entity.dart';
import 'package:goldcity/domain/entity/project_possibility/project_possibility_entity.dart';
import 'package:goldcity/domain/repository/project_detail/project_detail_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class ProjectDetailUseCase {
  Future<Either<BaseErrorModel, ProjectPossibilityEntity>>
      getProjectPossibility(int id) async {
    return locator<ProjectDetailRepository>().getProjectPossibility(id);
  }

  Future<Either<BaseErrorModel, TemplateEntity>> getProjectTemplateDetail(
      int projectDetailId, int settingsId) async {
    return locator<ProjectDetailRepository>()
        .getProjectTemplateDetail(projectDetailId, settingsId);
  }
}
