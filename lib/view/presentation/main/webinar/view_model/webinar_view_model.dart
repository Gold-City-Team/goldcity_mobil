import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/education/webinar_detail/education_detail_entity.dart';
import 'package:goldcity/domain/usecase/webinar_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:mobx/mobx.dart';

part 'webinar_view_model.g.dart';

class WebinarViewModel = _WebinarViewModelBase with _$WebinarViewModel;

abstract class _WebinarViewModelBase with Store, BaseViewModel {
  late WebinarUseCase _educationUseCase;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    _educationUseCase = locator<WebinarUseCase>();
    _getEducationList();
  }

  @observable
  List<WebinarDetailEntity>? model;
  @action
  Future<void> _getEducationList() async {
    var result = await _educationUseCase.getWebinarList();
    if (result.isRight) {
      model = result.right;
    }
  }

  openDetailPage(int id) {
    viewModelContext.goNamed(NavigationConstant.WEBINAR_DETAIL,
        pathParameters: {"meetingId": "$id"});
  }
}
