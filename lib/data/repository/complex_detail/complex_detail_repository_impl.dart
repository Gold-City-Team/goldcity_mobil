import 'package:either_dart/either.dart';
import 'package:goldcity/data/source/remote/complex_detail/complex_detail_remote_data_source.dart';
import 'package:goldcity/domain/entity/complex/complex_templates/complex_template_entity.dart';
import 'package:goldcity/domain/repository/complex_detail/complex_detail_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class ComplexDetailRepositoryImpl implements ComplexDetailRepository {
  @override
  Future<Either<BaseErrorModel, ComplexTemplateEntity>>
      getComplexTemplateDetail(int complexDetailId, int settingsId) async {
    var result = await locator<ComplexDetailRemoteDataSource>()
        .getComplexTemplateDetail(complexDetailId, settingsId);
    if (result.isRight) {
      return Right(result.right.toEntity());
    }
    return Left(result.left);
  }
}
