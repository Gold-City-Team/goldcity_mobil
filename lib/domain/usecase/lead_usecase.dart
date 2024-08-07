import 'package:goldcity/data/dto/send/lead/send_lead_apply_dto.dart';
import 'package:goldcity/data/dto/send/lead/send_lead_login_dto.dart';
import 'package:goldcity/data/dto/send/lead/send_lead_login_google_dto.dart';
import 'package:goldcity/domain/repository/lead/lead_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class LeadUseCase {
  Future<BaseErrorModel?> leadApply(SendLeadApplyDto dto) {
    return locator<LeadRepository>().apply(dto);
  }

  Future<BaseErrorModel?> leadLogin(SendLeadLoginDto dto) {
    return locator<LeadRepository>().login(dto);
  }

  Future<BaseErrorModel?> leadLoginGoogle(SendLeadLoginGoogleDto dto) {
    return locator<LeadRepository>().loginGoogle(dto);
  }
}
