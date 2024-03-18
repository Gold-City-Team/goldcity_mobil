import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/view/presentation/project/story/view_model/story_view_model.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';

class StoryView extends StatefulWidget {
  StoryView({super.key});

  @override
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  final photos = [
    "https://wallpapers.com/images/hd/4k-architecture-yellow-glass-building-6d7nbmyltxlyxxv8.jpg",
    "https://wallpapercave.com/wp/wp2752752.jpg",
    "https://wallpapercave.com/wp/wp2752761.jpg",
    "https://wallpapercave.com/wp/wp2752760.jpg"
  ];
  int index = 0;
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
            child: NormalNetworkImage(source: photos[index]),
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      index = index == 0 ? 0 : index - 1;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      index = index > 2 ? 3 : index + 1;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
