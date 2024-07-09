import 'package:dio/dio.dart';
import 'package:goldcity/config/data/remote_manager.dart';
import 'package:goldcity/data/dto/send/notification/send_notification_token_dto.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/enum/source_path.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class NotificationRemoteDataSource {
  Future<BaseErrorModel?> sendToken(SendNotificationTokenDto dto);
}

class NotificationRemoteDataSourceImpl extends NotificationRemoteDataSource {
  @override
  Future<BaseErrorModel?> sendToken(SendNotificationTokenDto dto) async {
    try {
      await locator<RemoteManager>()
          .networkManager
          .post(SourcePath.SEND_NOTIFICATION.rawValue(), data: dto.toJson());

      return null;
    } on DioException catch (e) {
      return BaseErrorModel.fromJson(e.response?.data ?? {});
    }
  }
}
