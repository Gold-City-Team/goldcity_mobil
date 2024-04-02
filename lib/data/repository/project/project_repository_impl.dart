import 'package:goldcity/data/source/remote/project/project_remote_data_source.dart';
import 'package:goldcity/domain/entity/project/project_detail/project_detail_entity.dart';
import 'package:goldcity/domain/repository/project/project_repository.dart';
import 'package:goldcity/injection_container.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  @override
  Future<ProjectDetailEntity> getDetail(int id) async {
    var result = await locator<ProjectRemoteDataSource>().getDetail(id);
    return result.toEntity();
  }
}
