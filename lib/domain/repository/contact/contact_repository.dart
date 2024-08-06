import 'package:either_dart/either.dart';
import 'package:goldcity/domain/entity/contact/contact_entity.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class ContactRepository {
  Future<Either<BaseErrorModel, ContactEntity>> getContactDetail();
}
