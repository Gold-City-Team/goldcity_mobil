import 'package:goldcity/domain/entity/project/project_detail/project_detail_entity.dart';

abstract class ProjectRepository {
  Future<ProjectDetailEntity> getDetail(int id);
}
