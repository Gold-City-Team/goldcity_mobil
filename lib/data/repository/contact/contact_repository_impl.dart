import 'package:either_dart/either.dart';
import 'package:goldcity/data/source/remote/contact/contact_remote_data_source.dart';
import 'package:goldcity/domain/entity/contact/contact_entity.dart';
import 'package:goldcity/domain/repository/contact/contact_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class ContactRepositoryImpl implements ContactRepository {
  @override
  Future<Either<BaseErrorModel, ContactEntity>> getContactDetail() async {
    var result = await locator<ContactRemoteDataSource>().getContactDetail();
    if (result.isRight) {
      return Right(result.right.toEntity());
    }
    return Left(result.left);
  }
}
