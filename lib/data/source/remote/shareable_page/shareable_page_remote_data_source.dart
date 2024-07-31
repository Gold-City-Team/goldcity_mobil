import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:goldcity/config/data/remote_manager.dart';
import 'package:goldcity/data/dto/receive/shareable_page/shareable_page_dto.dart';
import 'package:goldcity/data/dto/send/shareable_page/create_shareable_link_dto.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/enum/source_path.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class ShareablePageRemoteDataSource {
  Future<Either<BaseErrorModel?, String>> createLink(
      CreateShareableLinkDto dto);
  Future<Either<BaseErrorModel?, ShareablePageDto>> getLinkDetail(String uid);
}

class ShareablePageRemoteDataSourceImpl extends ShareablePageRemoteDataSource {
  @override
  Future<Either<BaseErrorModel?, String>> createLink(
      CreateShareableLinkDto dto) async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .post(SourcePath.SHARE_PAGE.rawValue(), data: dto.toJson());

      return Right(result.data);
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<Either<BaseErrorModel?, ShareablePageDto>> getLinkDetail(
      String uid) async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.SHARE_PAGE_DETAIL.rawValue(data: [uid]));

      return Right(ShareablePageDto.fromJson(result.data ?? {}));
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }
}
