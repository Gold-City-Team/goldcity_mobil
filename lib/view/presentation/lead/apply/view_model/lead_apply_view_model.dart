// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/data/dto/send/lead/send_lead_apply_dto.dart';
import 'package:goldcity/domain/usecase/lead_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:mobx/mobx.dart';

part 'lead_apply_view_model.g.dart';

class LeadApplyViewModel = _LeadApplyViewModelBase with _$LeadApplyViewModel;

abstract class _LeadApplyViewModelBase with Store, BaseViewModel {
  late LeadUseCase _leadUseCase;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    _leadUseCase = locator<LeadUseCase>();
  }

  String mailAdress = "";
  String telephone = "";
  String fullName = "";

  Future<void> apply() async {
    await _leadUseCase.leadApply(
      SendLeadApplyDto(
        campaignName: "MOBILE",
        language: "tr-TR",
        dataSource: "MOBILE",
        email: mailAdress,
        fullName: fullName,
        tel: telephone,
      ),
    );
  }

  Future<void> login() async {
    viewModelContext.pushNamed(NavigationConstant.LEAD_LOGIN);
  }
}
