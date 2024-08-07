// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/data/dto/send/lead/send_lead_login_dto.dart';
import 'package:goldcity/domain/usecase/lead_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:mobx/mobx.dart';

part 'lead_login_view_model.g.dart';

class LeadLoginViewModel = _LeadLoginViewModelBase with _$LeadLoginViewModel;

abstract class _LeadLoginViewModelBase with Store, BaseViewModel {
  late LeadUseCase _leadUseCase;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    _leadUseCase = locator<LeadUseCase>();
  }

  String mailAdress = "zaferkurumsal@gmail.com";
  String password = "10568332323";

  Future<void> login() async {
    var result = await _leadUseCase
        .leadLogin(SendLeadLoginDto(email: mailAdress, password: password));
    if (result == null) {
      viewModelContext.pushReplacement(NavigationConstant.DEFAULT);
    }
  }
}
