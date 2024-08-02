import 'package:either_dart/either.dart';
import 'package:goldcity/domain/entity/complex/complex/complex_entity.dart';
import 'package:goldcity/domain/entity/project/language/project_language_entity.dart';
import 'package:goldcity/domain/repository/complex/complex_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class ComplexUseCase {
  Stream<Either<BaseErrorModel, ComplexEntity>> getDetail(
      int id, int languageId) {
    return locator<ComplexRepository>().getDetail(id, languageId);
  }

  Stream<Either<BaseErrorModel, List<ComplexEntity>>> getComplexList() {
    return locator<ComplexRepository>().getComplexList();
  }

  Future<Either<BaseErrorModel, List<LanguageDetailEntity>>>
      getComplexLanguageList(int id) {
    return locator<ComplexRepository>().getComplexLanguageList(id);
  }
}
