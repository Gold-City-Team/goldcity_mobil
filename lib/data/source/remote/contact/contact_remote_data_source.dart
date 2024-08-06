import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:goldcity/config/data/remote_manager.dart';
import 'package:goldcity/data/dto/receive/contact/contact_dto.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/enum/source_path.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class ContactRemoteDataSource {
  Future<Either<BaseErrorModel, ContactDto>> getContactDetail();
}

class ContactRemoteDataSourceImpl extends ContactRemoteDataSource {
  @override
  Future<Either<BaseErrorModel, ContactDto>> getContactDetail() async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.CONTACT.rawValue());

      return Right(ContactDto.fromJson(result.data));
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }
}
