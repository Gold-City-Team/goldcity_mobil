import 'package:either_dart/either.dart';
import 'package:goldcity/data/dto/send/shareable_page/create_shareable_link_dto.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class ShareablePageRepository {
  Future<Either<BaseErrorModel?, String>> createLink(
      CreateShareableLinkDto dto);
}
