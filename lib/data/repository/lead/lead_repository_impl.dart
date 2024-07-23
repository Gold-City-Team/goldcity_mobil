import 'package:goldcity/data/dto/send/lead/send_lead_apply_dto.dart';
import 'package:goldcity/data/dto/send/lead/send_lead_login_dto.dart';
import 'package:goldcity/data/dto/send/lead/send_lead_login_google_dto.dart';
import 'package:goldcity/data/source/remote/lead/lead_remote_data_source.dart';
import 'package:goldcity/domain/repository/lead/lead_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class LeadRepositoryImpl implements LeadRepository {
  @override
  Future<BaseErrorModel?> apply(SendLeadApplyDto dto) async {
    return await locator<LeadRemoteDataSource>().apply(dto);
  }

  @override
  Future<BaseErrorModel?> login(SendLeadLoginDto dto) async {
    return await locator<LeadRemoteDataSource>().login(dto);
  }

  @override
  Future<BaseErrorModel?> loginGoogle(SendLeadLoginGoogleDto dto) async {
    return await locator<LeadRemoteDataSource>().loginGoogle(dto);
  }
}
