import 'package:goldcity/data/dto/send/lead/send_lead_apply_dto.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class LeadRepository {
  Future<BaseErrorModel?> apply(SendLeadApplyDto dto);
}
