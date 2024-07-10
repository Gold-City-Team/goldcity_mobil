import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:goldcity/config/data/remote_manager.dart';
import 'package:goldcity/data/dto/receive/webinar/webinar_detail/webinar_detail_dto.dart';
import 'package:goldcity/data/dto/receive/webinar/user_webinar/user_webinar_dto.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/enum/source_path.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class WebinarRemoteDataSource {
  Future<Either<BaseErrorModel, List<WebinarDetailDto>>> getWebinarList();
  Future<Either<BaseErrorModel, WebinarDetailDto>> getWebinar(int id);
  Future<BaseErrorModel?> applyWebinar(int meetingId);
  Future<Either<BaseErrorModel, UserWebinarDto>> getUserWebinar(int id);
}

class WebinarRemoteDataSourceImpl extends WebinarRemoteDataSource {
  @override
  Future<Either<BaseErrorModel, List<WebinarDetailDto>>>
      getWebinarList() async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.WEBINAR_LIST.rawValue());

      return Right((result.data as List)
          .map((e) => WebinarDetailDto.fromJson(e))
          .toList());
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<Either<BaseErrorModel, WebinarDetailDto>> getWebinar(int id) async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.WEBINAR.rawValue(data: [id]));

      return Right(WebinarDetailDto.fromJson(result.data));
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<BaseErrorModel?> applyWebinar(int meetingId) async {
    try {
      await locator<RemoteManager>()
          .networkManager
          .post(SourcePath.USER_WEBINAR.rawValue(data: [meetingId]));

      return null;
    } on DioException catch (e) {
      return BaseErrorModel.fromJson(e.response?.data ?? {});
    }
  }

  @override
  Future<Either<BaseErrorModel, UserWebinarDto>> getUserWebinar(int id) async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.USER_WEBINAR.rawValue(data: [id]));

      return Right(UserWebinarDto.fromJson(result.data));
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }
}
