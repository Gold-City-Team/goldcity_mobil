import 'package:either_dart/either.dart';
import 'package:goldcity/domain/entity/project/project_templates/project_template_entity.dart';
import 'package:goldcity/domain/repository/project_detail/project_detail_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class ProjectDetailUseCase {
  Future<Either<BaseErrorModel, ProjectTemplateEntity>>
      getProjectTemplateDetail(int projectDetailId, int settingsId) async {
    return locator<ProjectDetailRepository>()
        .getProjectTemplateDetail(projectDetailId, settingsId);
  }
}
