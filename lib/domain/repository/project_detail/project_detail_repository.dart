import 'package:either_dart/either.dart';
import 'package:goldcity/domain/entity/project/project_templates/template_entity.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class ProjectDetailRepository {
  Future<Either<BaseErrorModel, TemplateEntity>> getProjectTemplateDetail(
      int projectDetailId, int settingsId);
}
