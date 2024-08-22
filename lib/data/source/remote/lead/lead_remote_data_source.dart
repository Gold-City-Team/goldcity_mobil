import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:goldcity/config/data/remote_manager.dart';
import 'package:goldcity/data/dto/send/lead/change_password_dto.dart';
import 'package:goldcity/data/dto/send/lead/reset_password_dto.dart';
import 'package:goldcity/data/dto/send/lead/send_lead_apply_dto.dart';
import 'package:goldcity/data/dto/send/lead/send_lead_login_dto.dart';
import 'package:goldcity/data/dto/send/lead/send_lead_login_google_dto.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/enum/source_path.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class LeadRemoteDataSource {
  Future<BaseErrorModel?> apply(SendLeadApplyDto dto);
  Future<BaseErrorModel?> login(SendLeadLoginDto dto);
  Future<BaseErrorModel?> loginGoogle(SendLeadLoginGoogleDto dto);
  Future<BaseErrorModel?> leadChangePassword(ChangePasswordDto dto);
  Future<BaseErrorModel?> leadResetPassword(ResetPasswordDto dto);
  Future<BaseErrorModel?> deleteAccount();
  Future<Either<BaseErrorModel, String>> getTerms();

  Future<Either<BaseErrorModel, String>> getPrivacy();

  Future<Either<BaseErrorModel, String>> getInformation();

  Future<Either<BaseErrorModel, String>> getRegisterImage();

  Future<Either<BaseErrorModel, String>> getLoginImage();
  Future<Either<BaseErrorModel, String>> getVersion();
}

class LeadRemoteDataSourceImpl extends LeadRemoteDataSource {
  @override
  Future<BaseErrorModel?> apply(SendLeadApplyDto dto) async {
    try {
      await locator<RemoteManager>()
          .networkManager
          .post(SourcePath.LEAD.rawValue(), data: dto.toJson());
      return null;
    } on DioException catch (e) {
      return BaseErrorModel.fromJson(e.response?.data ?? {});
    }
  }

  @override
  Future<BaseErrorModel?> login(SendLeadLoginDto dto) async {
    try {
      await locator<RemoteManager>()
          .networkManager
          .post(SourcePath.LEAD_LOGIN.rawValue(), data: dto.toJson());

      return null;
    } on DioException catch (e) {
      return BaseErrorModel.fromJson(e.response?.data ?? {});
    }
  }

  @override
  Future<BaseErrorModel?> loginGoogle(SendLeadLoginGoogleDto dto) async {
    try {
      await locator<RemoteManager>()
          .networkManager
          .post(SourcePath.LEAD_LOGIN_GOOGLE.rawValue(), data: dto.toJson());

      return null;
    } on DioException catch (e) {
      return BaseErrorModel.fromJson(e.response?.data ?? {});
    }
  }

  @override
  Future<BaseErrorModel?> leadChangePassword(ChangePasswordDto dto) async {
    try {
      await locator<RemoteManager>()
          .networkManager
          .post(SourcePath.LEAD_CHANGE_PASSWORD.rawValue(), data: dto.toJson());

      return null;
    } on DioException catch (e) {
      return BaseErrorModel.fromJson(e.response?.data ?? {});
    }
  }

  @override
  Future<BaseErrorModel?> leadResetPassword(ResetPasswordDto dto) async {
    try {
      await locator<RemoteManager>()
          .networkManager
          .post(SourcePath.LEAD_FORGOT_PASSWORD.rawValue(), data: dto.toJson());

      return null;
    } on DioException catch (e) {
      return BaseErrorModel.fromJson(e.response?.data ?? {});
    }
  }

  @override
  Future<BaseErrorModel?> deleteAccount() async {
    try {
      await locator<RemoteManager>()
          .networkManager
          .delete(SourcePath.USER.rawValue());
      return null;
    } on DioException catch (e) {
      return BaseErrorModel.fromJson(e.response?.data ?? {});
    }
  }

  @override
  Future<Either<BaseErrorModel, String>> getInformation() async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.ILLUMINATION.rawValue());
      return Right(result.data["agreement"]);
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<Either<BaseErrorModel, String>> getPrivacy() async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.PRIVACY.rawValue());
      return Right(result.data["agreement"]);
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<Either<BaseErrorModel, String>> getTerms() async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.TERMS.rawValue());
      return Right(result.data["agreement"]);
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<Either<BaseErrorModel, String>> getLoginImage() async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.LOGIN_IMAGE.rawValue());
      return Right(result.data["image"]);
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<Either<BaseErrorModel, String>> getRegisterImage() async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.REGISTER_IMAGE.rawValue());
      return Right(result.data["image"]);
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<Either<BaseErrorModel, String>> getVersion() async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.VERSION.rawValue());
      return Right(result.data["version"]);
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }
}
