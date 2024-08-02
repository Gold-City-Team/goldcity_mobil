import 'package:either_dart/either.dart';
import 'package:goldcity/data/source/remote/complex/complex_remote_data_source.dart';
import 'package:goldcity/domain/entity/complex/complex/complex_entity.dart';
import 'package:goldcity/domain/entity/project/language/project_language_entity.dart';
import 'package:goldcity/domain/repository/complex/complex_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class ComplexRepositoryImpl implements ComplexRepository {
  @override
  Stream<Either<BaseErrorModel, List<ComplexEntity>>> getComplexList() async* {
    var result = await locator<ComplexRemoteDataSource>().getComplexList();
    if (result.isRight) {
      yield Right(result.right.map((e) => e.toEntity()).toList());
    } else {
      yield Left(result.left);
    }
  }

  @override
  Stream<Either<BaseErrorModel, ComplexEntity>> getDetail(
      int id, int languageId) async* {
    var result =
        await locator<ComplexRemoteDataSource>().getDetail(id, languageId);
    if (result.isRight) {
      yield Right(result.right.toEntity());
    } else {
      yield Left(result.left);
    }
  }

  @override
  Future<Either<BaseErrorModel, List<LanguageDetailEntity>>>
      getComplexLanguageList(int id) async {
    var result =
        await locator<ComplexRemoteDataSource>().getComplexLanguageList(id);
    if (result.isRight) {
      return Right(result.right.map((e) => e.toEntity()).toList());
    }
    return Left(result.left);
  }
}
