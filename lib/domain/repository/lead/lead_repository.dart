import 'package:goldcity/data/dto/send/lead/change_password_dto.dart';
import 'package:goldcity/data/dto/send/lead/reset_password_dto.dart';
import 'package:goldcity/data/dto/send/lead/send_lead_apply_dto.dart';
import 'package:goldcity/data/dto/send/lead/send_lead_login_dto.dart';
import 'package:goldcity/data/dto/send/lead/send_lead_login_google_dto.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class LeadRepository {
  Future<BaseErrorModel?> apply(SendLeadApplyDto dto);
  Future<BaseErrorModel?> login(SendLeadLoginDto dto);
  Future<BaseErrorModel?> loginGoogle(SendLeadLoginGoogleDto dto);
  Future<BaseErrorModel?> leadChangePassword(ChangePasswordDto dto);
  Future<BaseErrorModel?> leadResetPassword(ResetPasswordDto dto);
  Future<BaseErrorModel?> deleteAccount();
}
