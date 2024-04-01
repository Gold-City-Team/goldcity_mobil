import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:goldcity/config/data/remote_manager.dart';
import 'package:goldcity/data/dto/send/lead/send_lead_apply_dto.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/enum/source_path.dart';

abstract class LeadRemoteDataSource {
  Future<bool> apply(SendLeadApplyDto dto);
}

class LeadRemoteDataSourceImpl extends LeadRemoteDataSource {
  @override
  Future<bool> apply(SendLeadApplyDto dto) async {
    try {
      debugPrint("dto ${dto.toJson()}");
      await locator<RemoteManager>().networkManager.post(
            SourcePath.LEAD.rawValue(),
            data: dto.toJson(),
          );

      debugPrint("true geldi ");
      return true;
    } on DioException catch (e) {
      debugPrint("false geldi ${e.response}");

      return false;
    }
  }
}
