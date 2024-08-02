import 'package:either_dart/either.dart';
import 'package:goldcity/domain/entity/complex/complex_templates/complex_template_entity.dart';
import 'package:goldcity/domain/repository/complex_detail/complex_detail_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class ComplexDetailUseCase {
  Future<Either<BaseErrorModel, ComplexTemplateEntity>>
      getComplexTemplateDetail(int complexDetailId) async {
    return locator<ComplexDetailRepository>()
        .getComplexTemplateDetail(complexDetailId);
  }
}
