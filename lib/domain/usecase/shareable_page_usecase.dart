import 'package:either_dart/either.dart';
import 'package:goldcity/data/dto/send/shareable_page/create_shareable_link_dto.dart';
import 'package:goldcity/domain/repository/shareable_page/shareable_page_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class ShareablePageUseCase {
  Future<Either<BaseErrorModel?, String>> createLink(
      CreateShareableLinkDto dto) async {
    return locator<ShareablePageRepository>().createLink(dto);
  }

  Future<Either<BaseErrorModel?, String>> getLinkDetail(
      CreateShareableLinkDto dto) async {
    return locator<ShareablePageRepository>().createLink(dto);
  }
}
