import 'package:goldcity/domain/entity/project/project_detail/project_detail_entity.dart';

class ProjectEntity {
  int id;
  ProjectDetailEntity detail;
  ProjectEntity({required this.id, required this.detail});
}
