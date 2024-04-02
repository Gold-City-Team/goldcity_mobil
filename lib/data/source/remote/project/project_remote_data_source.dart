import 'package:dio/dio.dart';
import 'package:goldcity/config/data/remote_manager.dart';
import 'package:goldcity/data/dto/receive/project/project_detail/project_detail_dto.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/enum/source_path.dart';

abstract class ProjectRemoteDataSource {
  Future<ProjectDetailDto> getDetail(int id);
}

class ProjectRemoteDataSourceImpl extends ProjectRemoteDataSource {
  @override
  Future<ProjectDetailDto> getDetail(int id) async {
    try {
      var result = await locator<RemoteManager>().networkManager.post(
            SourcePath.LEAD.rawValue(data: [id]),
          );

      return result.data;
    } on DioException catch (_) {
      return ProjectDetailDto();
    }
  }
}
