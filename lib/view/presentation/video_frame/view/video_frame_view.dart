import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/view/presentation/video_frame/view_model/video_frame_view_model.dart';
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
    _controller.play();
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
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, VideoFrameViewModel value) =>
          Scaffold(
        body: Stack(
          children: [
            VideoPlayer(_controller),
          ],
        ),
      ),
    );
  }
}
