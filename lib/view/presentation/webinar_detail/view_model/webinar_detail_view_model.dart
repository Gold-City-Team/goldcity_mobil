import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/education/webinar_detail/education_detail_entity.dart';
import 'package:goldcity/domain/entity/education/user_webinar/user_webinar_entity.dart';
import 'package:goldcity/domain/usecase/webinar_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';

part 'webinar_detail_view_model.g.dart';

class WebinarDetailViewModel = _WebinarDetailViewModelBase
    with _$WebinarDetailViewModel;

abstract class _WebinarDetailViewModelBase with Store, BaseViewModel {
  late WebinarUseCase _educationUseCase;

  @override
  void setContext(BuildContext context) => viewModelContext = context;
  int meetingId = 0;
  @override
  void init() {
    _educationUseCase = locator<WebinarUseCase>();
    _getDetail();
  }

  @observable
  WebinarDetailEntity? model;
  @observable
  UserWebinarEntity? modelUserEducation;

  @observable
  bool isLoading = true;

  @action
  Future<void> _getDetail() async {
    isLoading = true;

    var result = await _educationUseCase.getWebinar(meetingId);
    if (result.isRight) {
      model = result.right;
      if (model!.isRegister) {
        var resultTwo = await _educationUseCase.getUserWebinar(meetingId);
        if (resultTwo.isRight) {
          modelUserEducation = resultTwo.right;
        }
      }
    }
    isLoading = false;
  }

  Future<void> apply() async {
    if (model!.isRegister) {
      launchUrl(Uri.parse(modelUserEducation!.joinUrl));
    } else {
      await _educationUseCase.applyWebinar(meetingId);
      _getDetail();
    }
  }
}
