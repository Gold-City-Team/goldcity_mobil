import 'package:goldcity/data/dto/send/notification/send_notification_token_dto.dart';
import 'package:goldcity/domain/repository/notification/notification_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class NotificationUseCase {
  Future<BaseErrorModel?> sendNotificationToken(SendNotificationTokenDto dto) {
    return locator<NotificationRepository>().sendToken(dto);
  }
}
