import 'package:dio/dio.dart';
import 'package:goldcity/config/data/remote_manager.dart';
import 'package:goldcity/data/dto/send/lead/send_lead_apply_dto.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/enum/source_path.dart';

abstract class LeadRemoteDataSource {
  Future<bool> apply(SendLeadApplyDto dto);
}

class LeadRemoteDataSourceImpl extends LeadRemoteDataSource {
  @override
  Future<bool> apply(SendLeadApplyDto dto) async {
    try {
      await locator<RemoteManager>().networkManager.post(
            SourcePath.LEAD.rawValue(),
            data: dto.toJson(),
          );
      return true;
    } on DioException catch (_) {
      return false;
    }
  }
}
