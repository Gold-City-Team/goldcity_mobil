import 'package:either_dart/either.dart';
import 'package:goldcity/domain/entity/complex/complex_templates/complex_template_entity.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class ComplexDetailRepository {
  Future<Either<BaseErrorModel, ComplexTemplateEntity>>
      getComplexTemplateDetail(int complexDetailId, int settingsId);
}
