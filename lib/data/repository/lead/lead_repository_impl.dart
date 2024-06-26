import 'package:goldcity/data/dto/send/lead/send_lead_apply_dto.dart';
import 'package:goldcity/data/source/remote/lead/lead_remote_data_source.dart';
import 'package:goldcity/domain/repository/lead/lead_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class LeadRepositoryImpl implements LeadRepository {
  @override
  Future<BaseErrorModel?> apply(SendLeadApplyDto dto) async {
    return await locator<LeadRemoteDataSource>().apply(dto);
  }
}
