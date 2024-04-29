import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/view/presentation/project/gallery/view_model/gallery_view_model.dart';
import 'package:goldcity/view/presentation/project/gallery/widget/gallery_row_widget.dart';
import 'package:goldcity/view/presentation/project/gallery/widget/main_row_widget.dart';

class GalleryView extends StatelessWidget {
  const GalleryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<GalleryViewModel>(
      viewModel: GalleryViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, GalleryViewModel value) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Observer(
                  builder: (context) {
                    if (value.projectGallery == null) {
                      return const SizedBox.shrink();
                    }
                    return Flexible(
                      flex: 2,
                      child: MainRowWidget(
                        onFullScreen: () => value.navigation.navigateToPage(
                            path: NavigationConstant.VIDEO_FRAME),
                        mediaEntity: value.projectGallery!.projectGallery[1],
                      ),
                    );
                  },
                ),
                Gap(context.midSpacerSize),
                Observer(
                  builder: (context) {
                    if (value.projectGallery == null || value.isFullScreen) {
                      return const SizedBox.shrink();
                    }
                    return Flexible(
                      flex: 3,
                      child: ListView.builder(
                        itemCount: value.projectGallery!.projectGallery.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: context.smallSpacerOnlyBottom,
                            child: GalleryRowWidget(
                              onFullScreen: () => null,
                              mediaEntity:
                                  value.projectGallery!.projectGallery[index],
                            ),
                          );
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
