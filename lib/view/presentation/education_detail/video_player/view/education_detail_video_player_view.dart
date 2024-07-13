import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/view/presentation/education_detail/video_player/view_model/education_detail_video_player_view_model.dart';
import 'package:goldcity/view/presentation/video_frame/view/video_frame_view.dart';

class EducationDetailVideoPlayerView extends StatelessWidget {
  final int videoId;
  const EducationDetailVideoPlayerView({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    return BaseView<EducationDetailVideoPlayerViewModel>(
      viewModel: EducationDetailVideoPlayerViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.videoId = videoId;
        model.init();
      },
      onPageBuilder:
          (BuildContext context, EducationDetailVideoPlayerViewModel value) =>
              Scaffold(
        body: Observer(builder: (context) {
          if (value.videoLink.isEmpty) {
            return const SizedBox.shrink();
          } else {
            return VideoFrameView(
                key: Key("${DateTime.now().millisecondsSinceEpoch}"),
                fullScreen: () {},
                isFullScreen: true,
                isBackVisible: true,
                url: value.videoLink);
          }
        }),
      ),
    );
  }
}
