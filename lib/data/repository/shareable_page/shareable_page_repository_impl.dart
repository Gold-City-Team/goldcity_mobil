import 'package:either_dart/either.dart';
import 'package:goldcity/data/dto/send/shareable_page/create_shareable_link_dto.dart';
import 'package:goldcity/data/source/remote/shareable_page/shareable_page_remote_data_source.dart';
import 'package:goldcity/domain/entity/shareable_page/shareable_page_entity.dart';
import 'package:goldcity/domain/repository/shareable_page/shareable_page_repository.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

class ShareablePageRepositoryImpl implements ShareablePageRepository {
  @override
  Future<Either<BaseErrorModel?, String>> createLink(
      CreateShareableLinkDto dto) async {
    var result = await locator<ShareablePageRemoteDataSource>().createLink(dto);
    if (result.isRight) {
      return Right(result.right);
    }
    return Left(result.left);
  }

  @override
  Future<Either<BaseErrorModel?, ShareablePageEntity>> getLinkDetail(
      String uid) async {
    var result =
        await locator<ShareablePageRemoteDataSource>().getLinkDetail(uid);
    if (result.isRight) {
      return Right(result.right.toEntity());
    }
    return Left(result.left);
  }
}
