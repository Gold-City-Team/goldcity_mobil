import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:goldcity/config/data/local_manager.dart';
import 'package:goldcity/config/data/remote_manager.dart';
import 'package:goldcity/data/dto/receive/project/project/project_dto.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/enum/source_path.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class ProjectRemoteDataSource {
  Future<Either<BaseErrorModel, ProjectDto>> getDetail(
      int projectId, languageId);
  Future<Either<BaseErrorModel, ProjectDto>> getProjectLanguageList(int id);

  Future<Either<BaseErrorModel, List<ProjectDto>>> getProjectList();
  Future<Either<BaseErrorModel, Map<String, dynamic>>> getFieldName(int id);
}

class ProjectRemoteDataSourceImpl extends ProjectRemoteDataSource {
  @override
  Future<Either<BaseErrorModel, ProjectDto>> getDetail(
      int projectId, languageId) async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.PROJECT.rawValue(data: [projectId, languageId]));
      locator<LocalManager>().cacheData(
          SourcePath.PROJECT.rawValue(data: [projectId, languageId]),
          [ProjectDto.fromJson(result.data ?? {})]);

      return Right(ProjectDto.fromJson(result.data ?? {}));
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<Either<BaseErrorModel, List<ProjectDto>>> getProjectList() async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.PROJECT_LIST.rawValue());

      locator<LocalManager>().cacheData(SourcePath.PROJECT_LIST.rawValue(),
          (result.data as List).map((e) => ProjectDto.fromJson(e)).toList());
      debugPrint("test ${result.headers}");
      return Right(
          (result.data as List).map((e) => ProjectDto.fromJson(e)).toList());
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<Either<BaseErrorModel, ProjectDto>> getProjectLanguageList(
      int id) async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.PROJECT_LANGUAGE_LIST.rawValue(data: [id]));

      return Right(ProjectDto.fromJson(result.data ?? {}));
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }

  @override
  Future<Either<BaseErrorModel, Map<String, dynamic>>> getFieldName(
      int id) async {
    try {
      var result = await locator<RemoteManager>()
          .networkManager
          .get(SourcePath.LOCALIZATION_FIELD_NAME.rawValue(data: [id]));
      return Right(jsonDecode(result.data.toString()) ?? {});
    } on DioException catch (e) {
      return Left(BaseErrorModel.fromJson(e.response?.data ?? {}));
    }
  }
}
