import 'package:goldcity/data/dto/send/lead/send_lead_apply_dto.dart';
import 'package:goldcity/domain/repository/lead/lead_repository.dart';
import 'package:goldcity/injection_container.dart';

class LeadUseCase {
  Future<bool> leadApply(SendLeadApplyDto dto) {
    return locator<LeadRepository>().apply(dto);
  }
}
