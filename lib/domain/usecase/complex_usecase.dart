import 'package:either_dart/either.dart';
import 'package:goldcity/domain/entity/complex/complex/complex_entity.dart';
import 'package:goldcity/domain/repository/complex/complex_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class ComplexUseCase {
  Stream<Either<BaseErrorModel, ComplexEntity>> getDetail(int id) {
    return locator<ComplexRepository>().getDetail(id);
  }

  Stream<Either<BaseErrorModel, List<ComplexEntity>>> getComplexList() {
    return locator<ComplexRepository>().getComplexList();
  }
}
