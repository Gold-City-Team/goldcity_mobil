import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/view/presentation/project/story/view_model/story_view_model.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';

class StoryView extends StatelessWidget {
  const StoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<StoryViewModel>(
      viewModel: StoryViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, StoryViewModel value) => Scaffold(
        body: Stack(children: [
          SizedBox(
            width: context.sWidth,
            height: context.sHeight,
            child: const NormalNetworkImage(
                source:
                    "https://iis-akakce.akamaized.net/p.z?%2F%2Fn11scdn%2Eakamaized%2Enet%2Fa1%2F1024%2F14%2F37%2F39%2F15%2FIMG%2D3371096655291613202%2Ejpg"),
          )
        ]),
      ),
    );
  }
}
