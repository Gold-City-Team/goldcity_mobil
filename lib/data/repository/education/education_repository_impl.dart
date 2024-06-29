import 'package:either_dart/either.dart';
import 'package:goldcity/data/source/remote/education/education_remote_data_source.dart';
import 'package:goldcity/domain/entity/education/education_detail/education_detail_entity.dart';
import 'package:goldcity/domain/repository/education/education_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class EducationRepositoryImpl implements EducationRepository {
  @override
  Future<Either<BaseErrorModel, List<EducationDetailEntity>>>
      getEducationList() async {
    var result = await locator<EducationRemoteDataSource>().getEducationList();
    if (result.isRight) {
      return Right(result.right.map((e) => e.toEntity()).toList());
    }
    return Left(result.left);
  }
}
