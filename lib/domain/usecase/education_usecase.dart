import 'package:either_dart/either.dart';
import 'package:goldcity/domain/entity/education/education_detail/education_detail_entity.dart';
import 'package:goldcity/domain/repository/education/education_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class EducationUseCase {
  Future<Either<BaseErrorModel, List<EducationDetailEntity>>>
      getEducationList() {
    return locator<EducationRepository>().getEducationList();
  }
}
