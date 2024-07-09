import 'package:goldcity/data/dto/send/notification/send_notification_token_dto.dart';
import 'package:goldcity/data/source/remote/notification/notification_remote_data_source.dart';
import 'package:goldcity/domain/repository/notification/notification_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  @override
  Future<BaseErrorModel?> sendToken(SendNotificationTokenDto dto) async {
    return await locator<NotificationRemoteDataSource>().sendToken(dto);

  }
}
