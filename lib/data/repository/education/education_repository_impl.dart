import 'package:either_dart/either.dart';
import 'package:goldcity/data/source/remote/education/education_remote_data_source.dart';
import 'package:goldcity/domain/entity/education/education_detail/education_detail_entity.dart';
import 'package:goldcity/domain/entity/education/user_education/user_education_entity.dart';
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

  @override
  Future<Either<BaseErrorModel, EducationDetailEntity>> getEducation(
      int id) async {
    var result = await locator<EducationRemoteDataSource>().getEducation(id);
    if (result.isRight) {
      return Right(result.right.toEntity());
    }
    return Left(result.left);
  }

  @override
  Future<BaseErrorModel?> applyEducation(int meetingId) async {
    return await locator<EducationRemoteDataSource>().applyEducation(meetingId);
  }

  @override
  Future<Either<BaseErrorModel, UserEducationEntity>> getUserEducation(
      int id) async {
    var result =
        await locator<EducationRemoteDataSource>().getUserEducation(id);
    if (result.isRight) {
      return Right(result.right.toEntity());
    }
    return Left(result.left);
  }
}
