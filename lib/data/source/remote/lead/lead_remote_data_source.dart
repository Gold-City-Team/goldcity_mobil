import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:goldcity/config/data/remote_manager.dart';
import 'package:goldcity/data/dto/send/lead/send_lead_apply_dto.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/enum/source_path.dart';
import 'package:goldcity/util/resources/base_error_model.dart';

abstract class LeadRemoteDataSource {
  Future<BaseErrorModel?> apply(SendLeadApplyDto dto);
}

class LeadRemoteDataSourceImpl extends LeadRemoteDataSource {
  @override
  Future<BaseErrorModel?> apply(SendLeadApplyDto dto) async {
    try {
      await locator<RemoteManager>()
          .networkManager
          .post(SourcePath.LEAD.rawValue(), data: dto.toJson());

      return null;
    } on DioException catch (e) {
      debugPrint("test");
      return BaseErrorModel.fromJson(e.response?.data ?? {});
    }
  }
}
