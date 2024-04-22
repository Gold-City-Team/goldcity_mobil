import 'package:flutter/cupertino.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:mobx/mobx.dart';

part 'video_frame_view_model.g.dart';

class VideoFrameViewModel = _VideoFrameViewModelBase with _$VideoFrameViewModel;

abstract class _VideoFrameViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {}
}
