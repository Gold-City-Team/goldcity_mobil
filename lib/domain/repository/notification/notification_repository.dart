import 'package:goldcity/data/dto/send/notification/send_notification_token_dto.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class NotificationRepository {
  Future<BaseErrorModel?> sendToken(SendNotificationTokenDto dto);
}
