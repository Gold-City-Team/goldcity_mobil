import 'package:either_dart/either.dart';
import 'package:goldcity/data/source/remote/project_detail/project_detail_remote_data_source.dart';
import 'package:goldcity/domain/entity/project/project_templates/project_template_entity.dart';
import 'package:goldcity/domain/repository/project_detail/project_detail_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class ProjectDetailRepositoryImpl implements ProjectDetailRepository {
  @override
  Future<Either<BaseErrorModel, ProjectTemplateEntity>>
      getProjectTemplateDetail(int settingsId) async {
    var result = await locator<ProjectDetailRemoteDataSource>()
        .getProjectTemplateDetail(settingsId);
    if (result.isRight) {
      return Right(result.right.toEntity());
    }
    return Left(result.left);
  }
}
