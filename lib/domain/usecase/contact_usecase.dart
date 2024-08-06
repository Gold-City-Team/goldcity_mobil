import 'package:either_dart/either.dart';
import 'package:goldcity/domain/entity/contact/contact_entity.dart';
import 'package:goldcity/domain/repository/contact/contact_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class ContactUseCase {
  Future<Either<BaseErrorModel, ContactEntity>> getContact() {
    return locator<ContactRepository>().getContactDetail();
  }
}
