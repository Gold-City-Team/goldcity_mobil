import 'package:either_dart/either.dart';
import 'package:goldcity/domain/entity/complex/complex/complex_entity.dart';
import 'package:goldcity/domain/entity/project/language/project_language_entity.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class ComplexRepository {
  Stream<Either<BaseErrorModel, List<ComplexEntity>>> getComplexList();
  Stream<Either<BaseErrorModel, ComplexEntity>> getDetail(
      int id, int languageId);
  Future<Either<BaseErrorModel, List<LanguageDetailEntity>>>
      getComplexLanguageList(int id);
}
