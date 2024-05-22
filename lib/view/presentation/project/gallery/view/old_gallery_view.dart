import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/data/dto/receive/project/project_gallery/project_gallery_dto.dart';
import 'package:goldcity/domain/entity/project/project_gallery_media_entity/project_gallery_media_entity.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/presentation/project/gallery/view_model/gallery_view_model.dart';
import 'package:goldcity/view/presentation/project/gallery/widget/gallery_row_widget.dart';
import 'package:goldcity/view/presentation/video_frame/view/video_frame_view.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class OldGalleryView extends StatefulWidget {
  final GALLERY_TYPE type;
  final int projectDetailId;
  const OldGalleryView({
    required this.type,
    required this.projectDetailId,
    super.key,
  });

  @override
  State<OldGalleryView> createState() => _OldGalleryViewState();
}

class _OldGalleryViewState extends State<OldGalleryView> {
  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<GalleryViewModel>(
      viewModel: GalleryViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.gallery_type = widget.type;
        model.init();
      },
      onPageBuilder: (BuildContext context, GalleryViewModel value) => Scaffold(
        body: Observer(builder: (context) {
          if (value.projectGallery == null) {
            return const SizedBox.shrink();
          }
          return body(value, context);
        }),
      ),
    );
  }

  Widget mainMediaPart(GalleryViewModel viewModel, BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            viewModel
                        .projectGallery!
                        .projectGallery[viewModel.selectedMediaIndex]
                        .media
                        .mediaType ==
                    MEDIA_TYPE.VIDEO
                ? Expanded(
                    child: VideoFrameView(
                      key: const Key("same"),
                      isFullScreen: true,
                      url: viewModel
                          .projectGallery!
                          .projectGallery[viewModel.selectedMediaIndex]
                          .media
                          .url,
                      fullScreen: () => viewModel.toggleFullScreen(),
                    ),
                  )
                : Expanded(
                    child: GestureDetector(
                      onTap: () => viewModel.toggleBottomListVisible(),
                      child: Container(
                        width: context.sWidth,
                        color: context.toColor(APPLICATION_COLOR.DARK),
                        child: NormalNetworkImage(
                          source: viewModel
                              .projectGallery!
                              .projectGallery[viewModel.selectedMediaIndex]
                              .media
                              .url,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
            AnimatedOpacity(
              duration: Duration.zero,
              opacity: viewModel.bottomListVisible ? 1 : 0,
              child: Container(
                padding: viewModel.bottomListVisible
                    ? context.midSpacerOnlyTop
                    : EdgeInsets.zero,
                color: context.toColor(APPLICATION_COLOR.DARK),
                child: SafeArea(
                  top: false,
                  bottom: viewModel.bottomListVisible,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: viewModel.bottomListVisible ? 125 : 0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          itemCount:
                              viewModel.projectGallery!.projectGallery.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () => !viewModel.bottomListVisible
                                    ? null
                                    : viewModel.selectedMediaIndexChange(index),
                                child: Padding(
                                  padding: context.midSpacerOnlyLeft,
                                  child: mediaPart(
                                      viewModel.projectGallery!
                                          .projectGallery[index],
                                      index == viewModel.selectedMediaIndex,
                                      context),
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        viewModel.isFullScreen ||
                viewModel
                        .projectGallery!
                        .projectGallery[viewModel.selectedMediaIndex]
                        .media
                        .mediaType !=
                    MEDIA_TYPE.VIDEO
            ? viewModel
                        .projectGallery!
                        .projectGallery[viewModel.selectedMediaIndex]
                        .media
                        .mediaType ==
                    MEDIA_TYPE.VIDEO
                ? Positioned(
                    left: 10,
                    top: 10,
                    child: SafeArea(
                      child: GestureDetector(
                        onTap: () => viewModel.toggleBottomListVisible(),
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
                              viewModel.bottomListVisible
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down,
                              size: 28,
                              color: viewModel.viewModelContext
                                  .toColor(APPLICATION_COLOR.GOLD),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Positioned(
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
                  )
            : const SizedBox.shrink(),
      ],
    );
  }

  Widget mediaPart(ProjectGalleryMediaEntity mediaEntity, bool isSelected,
      BuildContext context) {
    if (mediaEntity.media.mediaType == MEDIA_TYPE.VIDEO) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: context.toColor(isSelected
                    ? APPLICATION_COLOR.GOLD
                    : APPLICATION_COLOR.LIGHT),
              ),
            ),
            width: 175,
            height: 125,
            child: VideoFrameView(
              fullScreen: () => null,
              url: mediaEntity.media.url,
            ),
          ),
          SizedBox(
            height: 50,
            child: CircleAvatar(
              backgroundColor: context.toColor(APPLICATION_COLOR.LIGHT),
              maxRadius: 28,
              child: Icon(
                color: context.toColor(APPLICATION_COLOR.GOLD),
                Icons.play_arrow,
              ),
            ),
          )
        ],
      );
    }
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: context.toColor(
              isSelected ? APPLICATION_COLOR.GOLD : APPLICATION_COLOR.LIGHT),
        ),
      ),
      width: 175,
      height: 125,
      child: NormalNetworkImage(
        source: mediaEntity.media.url,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget body(GalleryViewModel viewModel, BuildContext context) {
    return SafeArea(
      bottom: !viewModel.isFullScreen,
      top: !viewModel.isFullScreen,
      left: !viewModel.isFullScreen,
      right: !viewModel.isFullScreen,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(flex: 2, child: mainMediaPart(viewModel, context)),
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
          Observer(builder: (context) {
            if (viewModel.projectGallery == null) {
              return const SizedBox.shrink();
            }
            return Row(
                children: viewModel
                    .categoryList()
                    .map((e) =>
                        Expanded(child: Center(child: LabelText(text: e))))
                    .toList());
          }),
          viewModel.isFullScreen != true
              ? Flexible(
                  flex: 3,
                  child: ListView.builder(
                    itemCount: viewModel.projectGallery!.projectGallery.length,
                    itemBuilder: (context, index) {
                      if (viewModel.selectedMediaIndex == index) {
                        return Padding(
                          padding: context.smallSpacerOnlyBottom,
                          child: GalleryRowWidget(
                            isSelected: true,
                            mediaEntity:
                                viewModel.projectGallery!.projectGallery[index],
                          ),
                        );
                      }
                      return GestureDetector(
                        onTap: () => viewModel.selectedMediaIndexChange(index),
                        child: Padding(
                          padding: context.smallSpacerOnlyBottom,
                          child: GalleryRowWidget(
                            isSelected: false,
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
