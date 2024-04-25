import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/view/presentation/video_frame/view_model/video_frame_view_model.dart';
import 'package:goldcity/view/presentation/video_frame/widget/video_player_self_controller.dart';
import 'package:goldcity/view/widget/slider/no_padding_slider.dart';
import 'package:mobx/mobx.dart';
import 'package:video_player/video_player.dart';

class VideoFrameView extends StatefulWidget {
  const VideoFrameView({super.key});

  @override
  State<VideoFrameView> createState() => _VideoFrameViewState();
}

class _VideoFrameViewState extends State<VideoFrameView> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_20mb.mp4'));
    _controller.setLooping(true);
    _controller.initialize();
    // _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<VideoFrameViewModel>(
      viewModel: VideoFrameViewModel(),
      onModelReady: (model) {
        model.controller = _controller;
        model.init();
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, VideoFrameViewModel value) =>
          Scaffold(
        body: Stack(
          children: [
            VideoPlayer(_controller),
            Container(color: Colors.black.withOpacity(.7)),
            Observer(builder: (context) {
              return Center(
                child: VideoPlayerSelfController(
                  isPlaying: value.isPlaying,
                  onTap: () => value.toggleVideo(),
                ),
              );
            }),
            Column(
              children: [
                const Spacer(),
                Observer(builder: (context) {
                  return Padding(
                    padding: context.midSpacerOnlyHorizontal,
                    child: NoPaddingSlider(
                      max: _controller.value.duration.inSeconds.toDouble(),
                      min: 0,
                      value: value.position,
                      changed: (e) => null,
                      changeStart: () => null,
                      darkBackground: true,
                      changeEnd: (e) => null,
                    ),
                  );
                }),
                Gap(context.midSpacerSize)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
