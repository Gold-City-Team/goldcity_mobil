import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/project/project_gallery_media_entity/project_gallery_media_entity.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/presentation/project/gallery/view_model/gallery_view_model.dart';
import 'package:goldcity/view/presentation/project/gallery/widget/gallery_row_widget.dart';
import 'package:goldcity/view/presentation/video_frame/view/video_frame_view.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

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
      onPageBuilder: (BuildContext context, GalleryViewModel value) => Scaffold(
        body: Observer(builder: (context) {
          if (value.projectGallery == null) {
            return const SizedBox.shrink();
          }
          return body(value);
        }),
      ),
    );
  }

  Widget mainMediaPart(GalleryViewModel viewModel) {
    if (viewModel.projectGallery!.projectGallery[viewModel.selectedMediaIndex]
            .media.mediaType ==
        MEDIA_TYPE.VIDEO) {
      return VideoFrameView(
        key: const Key("same"),
        isFullScreen: true,
        url: viewModel.projectGallery!
            .projectGallery[viewModel.selectedMediaIndex].media.url,
        fullScreen: () => viewModel.toggleFullScreen(),
      );
    }
    return GestureDetector(
      onTap: () => viewModel.toggleBottomListVisible(),
      child: Center(
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: NormalNetworkImage(
                    source: viewModel.projectGallery!
                        .projectGallery[viewModel.selectedMediaIndex].media.url,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            Positioned(
              right: 10,
              top: 10,
              child: SafeArea(
                child: GestureDetector(
                  onTap: () => viewModel.toggleFullScreen(),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: viewModel.viewModelContext
                            .toColor(APPLICATION_COLOR.OPPOSITE_COLOR),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: SizedBox(
                      child: Icon(
                        Icons.fullscreen,
                        size: 28,
                        color: viewModel.viewModelContext
                            .toColor(APPLICATION_COLOR.GOLD),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            viewModel.bottomListVisible && viewModel.isFullScreen
                ? SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                viewModel.projectGallery!.projectGallery.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () =>
                                      viewModel.selectedMediaIndexChange(index),
                                  child: Padding(
                                    padding: context.midSpacerOnlyLeft,
                                    child: mediaPart(viewModel
                                        .projectGallery!.projectGallery[index]),
                                  ));
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  Widget mediaPart(ProjectGalleryMediaEntity mediaEntity) {
    if (mediaEntity.media.mediaType == MEDIA_TYPE.VIDEO) {
      return SizedBox(
        width: 100,
        height: 100,
        child: VideoFrameView(
          fullScreen: () => null,
          url: mediaEntity.media.url,
        ),
      );
    }
    return SizedBox(
      width: 100,
      height: 100,
      child: NormalNetworkImage(
        source: mediaEntity.media.url,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget body(GalleryViewModel viewModel) {
    return SafeArea(
      bottom: !viewModel.isFullScreen,
      top: !viewModel.isFullScreen,
      left: !viewModel.isFullScreen,
      right: !viewModel.isFullScreen,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(flex: 2, child: mainMediaPart(viewModel)),
          viewModel.isFullScreen != true
              ? Gap(viewModel.viewModelContext.midSpacerSize)
              : const SizedBox.shrink(),
          viewModel.isFullScreen != true
              ? Padding(
                  padding: viewModel.viewModelContext.midSpacerOnlyLeft,
                  child: LabelText(
                      text: viewModel.projectGallery!
                          .projectGallery[viewModel.selectedMediaIndex].title,
                      fontSize: FONT_SIZE.TITLE_LARGE),
                )
              : const SizedBox.shrink(),
          viewModel.isFullScreen != true
              ? Gap(viewModel.viewModelContext.midSpacerSize)
              : const SizedBox.shrink(),
          viewModel.isFullScreen != true
              ? Padding(
                  padding: viewModel.viewModelContext.midSpacerOnlyLeft,
                  child: LabelText(
                      text: viewModel
                          .projectGallery!
                          .projectGallery[viewModel.selectedMediaIndex]
                          .description,
                      fontSize: FONT_SIZE.LABEL_MEDIUM),
                )
              : const SizedBox.shrink(),
          viewModel.isFullScreen != true
              ? Gap(viewModel.viewModelContext.midSpacerSize)
              : const SizedBox.shrink(),
          viewModel.isFullScreen != true
              ? Flexible(
                  flex: 3,
                  child: ListView.builder(
                    itemCount: viewModel.projectGallery!.projectGallery.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => viewModel.selectedMediaIndexChange(index),
                        child: Padding(
                          padding: context.smallSpacerOnlyBottom,
                          child: GalleryRowWidget(
                            mediaEntity:
                                viewModel.projectGallery!.projectGallery[index],
                          ),
                        ),
                      );
                    },
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
