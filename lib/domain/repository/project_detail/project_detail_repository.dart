import 'package:either_dart/either.dart';
import 'package:goldcity/domain/entity/project/template/template_entity.dart';
import 'package:goldcity/domain/entity/project_possibility/project_possibility_entity.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class ProjectDetailRepository {
  Future<Either<BaseErrorModel, ProjectPossibilityEntity>>
      getProjectPossibility(int id);

  Future<Either<BaseErrorModel, TemplateEntity>> getProjectTemplateDetail(
      int projectDetailId, int settingsId);
}
