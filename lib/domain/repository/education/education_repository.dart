import 'package:either_dart/either.dart';
import 'package:goldcity/domain/entity/education/education_detail/education_detail_entity.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class EducationRepository {
  Future<Either<BaseErrorModel, List<EducationDetailEntity>>>
      getEducationList();
}
