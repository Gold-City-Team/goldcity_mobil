// ignore_for_file: library_private_types_in_public_api

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/config/language/locale_keys.g.dart';
import 'package:goldcity/data/dto/send/lead/send_lead_apply_dto.dart';
import 'package:goldcity/domain/usecase/lead_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:goldcity/view/widget/snackbar/error_snackbar.dart';
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
    _getPolicy();
  }

  String mailAdress = "";
  String telephone = "";
  String fullName = "";

  @observable
  bool agreement = false;

  @action
  void changeAgreement() => agreement = !agreement;

  Future<void> apply() async {
    if (agreement) {
      var result = await _leadUseCase.leadApply(
        SendLeadApplyDto(
          campaignName: "MOBILE",
          language: "tr-TR",
          dataSource: "MOBILE",
          email: mailAdress,
          fullName: fullName,
          tel: telephone,
        ),
      );
      if (result == null) {
        showSnackbar(ErrorSnackBar(message: "Başvurun Alındı!"))
            .show(viewModelContext);
        viewModelContext.pop();
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
    } else {
      showSnackbar(ErrorSnackBar(message: LocaleKeys.pleaseAgreements.tr()))
          .show(viewModelContext);
    }
  }

  @observable
  String term = "";

  String privacy = "";
  String illumination = "";

  @action
  Future<void> _getPolicy() async {
    var result = await _leadUseCase.getPrivacy();
    if (result.isRight) {
      privacy = result.right;
      debugPrint("test $privacy");
    }

    var result2 = await _leadUseCase.getTerms();
    if (result2.isRight) {
      term = result2.right;
      debugPrint("test terms $term");
    }

    var result3 = await _leadUseCase.getInformation();
    if (result3.isRight) {
      illumination = result3.right;
      debugPrint("test info $illumination");
    }
  }

  Future<void> login() async {
    viewModelContext.pushNamed(NavigationConstant.LEAD_LOGIN);
  }
}
