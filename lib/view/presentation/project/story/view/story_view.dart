import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/config/notifier/theme_notifier.dart';
import 'package:goldcity/view/presentation/project/story/view_model/story_view_model.dart';
import 'package:goldcity/view/presentation/project/story/widget/story_flag_widget.dart';
import 'package:goldcity/view/presentation/project/story/widget/story_media_widget.dart';
import 'package:provider/provider.dart';

class StoryView extends StatelessWidget {
  const StoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<StoryViewModel>(
      viewModel: StoryViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, StoryViewModel value) {
        return DismissiblePage(
          isFullScreen: true,
          backgroundColor:
              context.watch<ThemeNotifier>().colorScheme.backgroundColor,
          onDismissed: () {
            value.navigation.pop();
          },
          child: Stack(
            children: [
              Observer(builder: (context) {
                return value.storyList.isNotEmpty
                    ? StoryMediaWidget(value.storyList[value.index])
                    : const SizedBox.shrink();
              }),
              SafeArea(
                child: Observer(
                  builder: (context) {
                    return SizedBox(
                      height: 10,
                      child: Row(
                        children: List.generate(
                          value.storyList.length,
                          (index) => Expanded(
                              child: StoryFlagWidget(index == value.index)),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        value.previusStory();
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
                        value.nextStory();
                      },
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
