import 'package:either_dart/either.dart';
import 'package:goldcity/domain/entity/project/project_templates/project_template_entity.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class ComplexRepository {
  Future<Either<BaseErrorModel, ProjectTemplateEntity>>
      getProjectTemplateDetail(int projectDetailId, int settingsId);
}
