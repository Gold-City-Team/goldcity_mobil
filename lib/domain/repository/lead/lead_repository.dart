import 'package:goldcity/data/dto/send/lead/send_lead_apply_dto.dart';

abstract class LeadRepository {
  Future<bool> apply(SendLeadApplyDto dto);
}
