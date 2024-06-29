import 'package:either_dart/either.dart';
import 'package:goldcity/domain/entity/education/education_detail/education_detail_entity.dart';
import 'package:goldcity/domain/entity/education/user_education/user_education_entity.dart';
import 'package:goldcity/domain/repository/education/education_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class EducationUseCase {
  Future<Either<BaseErrorModel, List<EducationDetailEntity>>>
      getEducationList() {
    return locator<EducationRepository>().getEducationList();
  }

  Future<Either<BaseErrorModel, EducationDetailEntity>> getEducation(int id) {
    return locator<EducationRepository>().getEducation(id);
  }

  Future<BaseErrorModel?> applyEducation(int id) {
    return locator<EducationRepository>().applyEducation(id);
  }

  Future<Either<BaseErrorModel, UserEducationEntity>> getUserEducation(int id) {
    return locator<EducationRepository>().getUserEducation(id);
  }
}
