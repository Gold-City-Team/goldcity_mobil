import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:goldcity/config/data/remote_manager.dart';
import 'package:goldcity/data/dto/receive/education/education/education_dto.dart';
import 'package:goldcity/data/dto/receive/gallery_media/gallery_media_dto.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/enum/source_path.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class EducationRemoteDataSource {
  Future<Either<BaseErrorModel, List<EducationDto>>> getEducationList();
  Future<Either<BaseErrorModel, EducationDto>> getEducation(int id);
  Future<Either<BaseErrorModel, GalleryMediaDto>> getEducationVideo(int id);
}

class EducationRemoteDataSourceImpl extends EducationRemoteDataSource {
  @override
  Future<Either<BaseErrorModel, List<EducationDto>>> getEducationList() async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.EDUCATION_LIST.rawValue());

      return Right(
          (result.data as List).map((e) => EducationDto.fromJson(e)).toList());
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<Either<BaseErrorModel, EducationDto>> getEducation(int id) async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.EDUCATION.rawValue(data: [id]));

      return Right(EducationDto.fromJson(result.data));
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<Either<BaseErrorModel, GalleryMediaDto>> getEducationVideo(
      int id) async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.EDUCATION_GALLERY.rawValue(data: [id]));

      return Right(GalleryMediaDto.fromJson(result.data));
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }
}
