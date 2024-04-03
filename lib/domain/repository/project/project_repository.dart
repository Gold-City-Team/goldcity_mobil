import 'package:either_dart/either.dart';
import 'package:goldcity/domain/entity/project/project_detail/project_detail_entity.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class ProjectRepository {
  Future<Either<BaseErrorModel, ProjectDetailEntity>> getDetail(int id);
}
