import 'package:either_dart/either.dart';
import 'package:goldcity/domain/entity/education/education/education_entity.dart';
import 'package:goldcity/domain/repository/education/education_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class EducationUseCase {
  Future<Either<BaseErrorModel, List<EducationEntity>>>
      getEducationList() async {
    return locator<EducationRepository>().getEducationList();
  }

  Future<Either<BaseErrorModel, EducationEntity>> getEducation(int id) async {
    return locator<EducationRepository>().getEducation(id);
  }
}
