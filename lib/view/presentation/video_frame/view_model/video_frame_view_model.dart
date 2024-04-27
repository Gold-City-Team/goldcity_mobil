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
    timer?.cancel();
    positionUpdater();
  }

  @observable
  bool isPlaying = false;

  @action
  void toggleVideo() {
    if (isOpacityFull) {
      controller.value.isPlaying ? controller.pause() : controller.play();
      isPlaying = controller.value.isPlaying;
    }
    _autoToggleOpacity();
  }

  @observable
  double position = 0;
  Timer? timer;
  @action
  void positionUpdater() {
    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (isPlaying) {
        position = controller.value.position.inSeconds.toDouble();
      }
    });
  }

  @action
  onChangeEnd(double lastPosition) {
    if (isOpacityFull) {
      position = lastPosition;
      controller.seekTo(Duration(seconds: lastPosition.toInt()));
      oldPosition = lastPosition;
      controller.play();
      isPlaying = true;
    }
  }

  @observable
  double oldPosition = -1;

  @action
  onChanging(double value) {
    if (isOpacityFull) {
      _autoToggleOpacity();
      position = value;
    }
  }

  @observable
  bool isOpacityFull = false;

  Timer? _timer;

  @action
  void _autoToggleOpacity() {
    _timer?.cancel();
    isOpacityFull = true;
    _timer =
        Timer(const Duration(milliseconds: 2500), () => isOpacityFull = false);
  }

  @action
  void toggleOpacity() {
    _timer?.cancel();
    isOpacityFull = !isOpacityFull;
    _timer =
        Timer(const Duration(milliseconds: 2500), () => isOpacityFull = false);
  }

  @action
  onChangeStart() {
    if (isOpacityFull) {
      isPlaying = false;
      controller.pause();
    }
  }
}
