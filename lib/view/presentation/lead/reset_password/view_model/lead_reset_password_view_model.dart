// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/data/dto/send/lead/reset_password_dto.dart';
import 'package:goldcity/domain/usecase/lead_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:goldcity/view/widget/snackbar/error_snackbar.dart';
import 'package:mobx/mobx.dart';

part 'lead_reset_password_view_model.g.dart';

class LeadResetPasswordViewModel = _LeadResetPasswordViewModelBase
    with _$LeadResetPasswordViewModel;

abstract class _LeadResetPasswordViewModelBase with Store, BaseViewModel {
  late LeadUseCase _leadUseCase;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    _leadUseCase = locator<LeadUseCase>();
    _getImage();
  }

  String mailAdress = "";

  Future<void> reset() async {
    debugPrint("test $mailAdress");
    var result = await _leadUseCase
        .leadResetPassword(ResetPasswordDto(email: mailAdress));
    if (result == null) {
      viewModelContext.pushReplacement(NavigationConstant.MAIN);
    } else {
      if (result.errors != null) {
        showSnackbar(ErrorSnackBar(
                message: result.errors!.entries.first.value.first))
            .show(viewModelContext);
      } else {
        showSnackbar(ErrorSnackBar(message: result.detail ?? ""))
            .show(viewModelContext);
      }
    }
  }

  @observable
  String image = "";
  @action
  _getImage() async {
    var result = await _leadUseCase.getLoginImage();
    if (result.isRight) {
      image = result.right;
    }
  }
}
