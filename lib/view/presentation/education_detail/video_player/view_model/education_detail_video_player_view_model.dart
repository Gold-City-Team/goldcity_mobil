import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/usecase/education_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:mobx/mobx.dart';

part 'education_detail_video_player_view_model.g.dart';

class EducationDetailVideoPlayerViewModel = _EducationDetailVideoPlayerViewModelBase
    with _$EducationDetailVideoPlayerViewModel;

abstract class _EducationDetailVideoPlayerViewModelBase
    with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  late int videoId;
  late EducationUseCase _educationUseCase;

  @override
  void init() {
    _educationUseCase = locator<EducationUseCase>();
    _getVideoLink();
  }

  @observable
  String videoLink = "";

  @action
  Future<void> _getVideoLink() async {
    var result = await _educationUseCase.getEducationVideo(videoId);
    if (result.isRight) {
      videoLink = result.right.media.url;
    } else {
      debugPrint("test ${result.left.status} --- ${videoId}");
    }
  }
}
