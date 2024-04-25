import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:mobx/mobx.dart';
import 'package:video_player/video_player.dart';

part 'video_frame_view_model.g.dart';

class VideoFrameViewModel = _VideoFrameViewModelBase with _$VideoFrameViewModel;

abstract class _VideoFrameViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;
  late VideoPlayerController controller;
  @action
  @override
  void init() {
    isPlaying = controller.value.isPlaying;
    positionUpdater();
  }

  @observable
  bool isPlaying = false;

  @action
  void toggleVideo() {
    controller.value.isPlaying ? controller.pause() : controller.play();
    isPlaying = controller.value.isPlaying;
  }

  @observable
  double position = 0;

  @action
  void positionUpdater() {
    var t = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      debugPrint("test");
      position = controller.value.position.inSeconds.toDouble();
      positionUpdater();
    });
    t.cancel();
  }
}
