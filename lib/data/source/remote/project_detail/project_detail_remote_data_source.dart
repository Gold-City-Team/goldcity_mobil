import 'package:either_dart/either.dart';
import 'package:goldcity/data/dto/receive/project_possibility/project_possibility_dto.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class ProjectDetailRemoteDataSource {
  Future<Either<BaseErrorModel, ProjectPossibilityDto>> getProjectPossibility(
      int id);
}

class ProjectDetailRemoteDataSourceImpl extends ProjectDetailRemoteDataSource {
  @override
  Future<Either<BaseErrorModel, ProjectPossibilityDto>> getProjectPossibility(
      int id) {
    // TODO: implement getProjectPossibility
    throw UnimplementedError();
  }
}
