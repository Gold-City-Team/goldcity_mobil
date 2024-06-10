import 'package:either_dart/either.dart';
import 'package:goldcity/domain/entity/project/project_templates/template_entity.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class ComplexRepository {
  Future<Either<BaseErrorModel, TemplateEntity>> getProjectTemplateDetail(
      int projectDetailId, int settingsId);
}
