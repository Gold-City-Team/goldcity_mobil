import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/presentation/video_frame/view_model/video_frame_view_model.dart';
import 'package:goldcity/view/presentation/video_frame/widget/video_player_self_controller.dart';
import 'package:goldcity/view/widget/slider/no_padding_slider.dart';
import 'package:video_player/video_player.dart';

class VideoFrameView extends StatefulWidget {
  final VoidCallback fullScreen;
  final bool isFullScreen;
  final bool isBackVisible;
  final String url;
  const VideoFrameView(
      {required this.fullScreen,
      required this.url,
      this.isBackVisible = false,
      this.isFullScreen = false,
      super.key});

  @override
  State<VideoFrameView> createState() => _VideoFrameViewState();
}

class _VideoFrameViewState extends State<VideoFrameView>
    with WidgetsBindingObserver {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url));
    _controller.setLooping(true);
    _controller.initialize().then((value) => {
          _controller.addListener(() {
            setState(() {
              if (!_controller.value.isInitialized) {
                setState(() {});
              }
            });
          })
        });
    if (widget.isFullScreen == true) {
      _controller.play();
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {}

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
            Center(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            ),
            widget.isFullScreen
                ? Observer(
                    builder: (context) => AnimatedOpacity(
                      opacity: value.isOpacityFull ? 1 : 0,
                      duration: const Duration(milliseconds: 100),
                      child: Container(
                        color: Colors.black.withOpacity(.7),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            widget.isFullScreen
                ? GestureDetector(onTap: () => value.toggleOpacity())
                : const SizedBox.shrink(),
            widget.isFullScreen
                ? Observer(builder: (context) {
                    return AnimatedOpacity(
                      duration: const Duration(milliseconds: 100),
                      opacity: value.isOpacityFull ? 1 : 0,
                      child: Center(
                        child: VideoPlayerSelfController(
                          isPlaying: value.isPlaying,
                          onTap: () => value.toggleVideo(),
                        ),
                      ),
                    );
                  })
                : const SizedBox.shrink(),
            widget.isFullScreen
                ? Column(
                    children: [
                      const Spacer(),
                      Observer(builder: (context) {
                        return AnimatedOpacity(
                          duration: const Duration(milliseconds: 100),
                          opacity: value.isOpacityFull ? 1 : 0,
                          child: Padding(
                            padding: context.largeSpacerOnlyHorizontal,
                            child: NoPaddingSlider(
                              max: _controller.value.duration.inSeconds
                                  .toDouble(),
                              min: 0,
                              value: value.position,
                              changed: (e) => value.onChanging(e),
                              changeStart: () => value.onChangeStart(),
                              changeEnd: (e) => value.onChangeEnd(e),
                            ),
                          ),
                        );
                      }),
                      Gap(context.midSpacerSize)
                    ],
                  )
                : const SizedBox.shrink(),
            widget.isFullScreen && !widget.isBackVisible
                ? Observer(builder: (context) {
                    return value.isOpacityFull
                        ? Positioned(
                            right: 10,
                            top: 10,
                            child: SafeArea(
                              child: GestureDetector(
                                onTap: () => widget.fullScreen(),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: context.toColor(
                                          APPLICATION_COLOR.OPPOSITE_COLOR),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: SizedBox(
                                    child: Icon(
                                      Icons.fullscreen,
                                      size: 28,
                                      color: context
                                          .toColor(APPLICATION_COLOR.GOLD),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink();
                  })
                : const SizedBox.shrink(),
            widget.isBackVisible
                ? Observer(builder: (context) {
                    return value.isOpacityFull
                        ? Positioned(
                            left: 10,
                            top: 10,
                            child: SafeArea(
                              child: GestureDetector(
                                onTap: () => context.pop(),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: context.toColor(
                                          APPLICATION_COLOR.OPPOSITE_COLOR),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: SizedBox(
                                    child: Icon(
                                      Icons.arrow_back,
                                      size: 28,
                                      color: context
                                          .toColor(APPLICATION_COLOR.GOLD),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink();
                  })
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
