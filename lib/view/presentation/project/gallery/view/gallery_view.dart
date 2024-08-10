// ignore_for_file: must_be_immutable
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/config/language/locale_keys.g.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/domain/entity/gallery_media/gallery_media_entity.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/presentation/project/gallery/view_model/gallery_view_model.dart';
import 'package:goldcity/view/presentation/video_frame/view/video_frame_view.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class GalleryView extends StatefulWidget {
  final List<GalleryMediaEntity> gallery;
  final int selectedIndex;
  final bool isExperiance;

  const GalleryView({
    required this.gallery,
    required this.selectedIndex,
    this.isExperiance = false,
    super.key,
  });

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  ScrollController c = ScrollController();
  late GalleryViewModel v;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!widget.isExperiance) {
        if (v.gallery.first.media.mediaType == MEDIA_TYPE.IMAGE) {
          if (isTablet()) {
            c.jumpTo(v.selectedMediaIndex * (150 * 1.84));
          } else {
            c.animateTo(
              v.selectedMediaIndex * 150,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<GalleryViewModel>(
      viewModel: GalleryViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.gallery = widget.gallery;
        model.selectedMediaIndex = widget.selectedIndex;
        model.isExperiance = widget.isExperiance;
        model.init();
        v = model;
      },
      onPageBuilder: (BuildContext context, GalleryViewModel value) =>
          Scaffold(body: body(value, context)),
    );
  }

  CarouselController carouselController = CarouselController();
  Widget body(GalleryViewModel viewModel, BuildContext context) {
    return isTablet()
        ? viewModel.gallery.first.media.mediaType == MEDIA_TYPE.IMAGE
            ? tabletImageView(viewModel, carouselController)
            : videoView(viewModel)
        : viewModel.gallery.first.media.mediaType == MEDIA_TYPE.IMAGE
            ? widget.isExperiance
                ? phoneImageViewExperiance(viewModel, carouselController)
                : phoneImageView(viewModel, carouselController)
            : videoView(viewModel);
  }

  Widget phoneImageViewExperiance(
      GalleryViewModel viewModel, CarouselController controller) {
    return Center(
      child: FlutterCarousel(
        options: CarouselOptions(
            controller: controller,
            viewportFraction: 1,
            showIndicator: true,
            initialPage: viewModel.selectedMediaIndex,
            enlargeCenterPage: true,
            aspectRatio: 9 / 16,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
            pageSnapping: true),
        items: viewModel.gallery.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return SizedBox(
                width: context.sWidth,
                height: context.sHeight,
                child: NormalNetworkImage(
                  fit: BoxFit.contain,
                  source: i.media.url,
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Widget phoneImageView(
      GalleryViewModel viewModel, CarouselController controller) {
    return Row(
      children: [
        SafeArea(
          right: false,
          top: false,
          bottom: false,
          child: Observer(builder: (context) {
            if (viewModel.selectedMediaIndex == -1) {
              return const SizedBox.shrink();
            }
            return Container(
              padding: context.midSpacerOnlyTop,
              width: 100,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                controller: c,
                itemCount: viewModel.gallery.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 150,
                    width: 100,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => {
                          viewModel.selectedMediaIndexChange(index),
                          controller.jumpToPage(index)
                        },
                        child: Padding(
                          padding: context.midSpacerOnlyBottom,
                          child: mediaPart(viewModel.gallery[index].media.url,
                              viewModel.selectedMediaIndex == index, context),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }),
        ),
        Gap(context.midSpacerSize),
        Expanded(
          child: FlutterCarousel(
            options: CarouselOptions(
                onPageChanged: (index, reason) {
                  c.animateTo(index * 150,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);

                  viewModel.selectedMediaIndexChange(index);
                },
                controller: controller,
                showIndicator: false,
                initialPage: viewModel.selectedMediaIndex,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                pageSnapping: true),
            items: viewModel.gallery.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: context.midSpacerOnlyHorizontal,
                    width: context.sWidth,
                    child: NormalNetworkImage(
                      fit: BoxFit.contain,
                      source: i.media.url,
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget tabletImageView(
      GalleryViewModel viewModel, CarouselController controller) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(context.midSpacerSize),
              Align(
                alignment: Alignment.topRight,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => context.pop(),
                    child: Container(
                      width: 50,
                      margin: context.largeSpacerOnlyHorizontal,
                      height: 50,
                      decoration: BoxDecoration(
                          color: context.toColor(APPLICATION_COLOR.GOLD),
                          borderRadius: context.midRadius),
                      child: const Icon(Icons.close),
                    ),
                  ),
                ),
              ),
              Gap(context.midSpacerSize),
              Flexible(
                flex: 2,
                child: SizedBox(
                  width: context.sWidth,
                  child: FlutterCarousel(
                    options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          viewModel.selectedMediaIndexChange(index);
                          if (index + 4 <= viewModel.gallery.length) {
                            c.jumpTo(index * (150 * 1.84));
                          }
                        },
                        controller: carouselController,
                        showIndicator: false,
                        initialPage: viewModel.selectedMediaIndex,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        pageSnapping: true),
                    items: viewModel.gallery.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            margin: context.midSpacerOnlyHorizontal,
                            width: context.sWidth,
                            child: NormalNetworkImage(
                              fit: BoxFit.contain,
                              source: i.media.url,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
              Gap(context.largeSpacerSize),
              Observer(builder: (context) {
                if (viewModel.selectedMediaIndex == -1) {
                  return const SizedBox.shrink();
                }
                return SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      itemCount: viewModel.gallery.length,
                      controller: c,
                      itemBuilder: (context, index) {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => {
                              viewModel.selectedMediaIndexChange(index),
                              carouselController.jumpToPage(index)
                            },
                            child: Padding(
                              padding: context.midSpacerOnlyLeft,
                              child: mediaPart(
                                  viewModel.gallery[index].media.url,
                                  viewModel.selectedMediaIndex == index,
                                  context),
                            ),
                          ),
                        );
                      },
                    ));
              })
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  if (viewModel.selectedMediaIndex !=
                      viewModel.gallery.length - 1) {
                    viewModel.selectedMediaIndexChange(
                        viewModel.selectedMediaIndex + 1);
                    controller.jumpToPage(viewModel.selectedMediaIndex);
                  }
                },
                child: Container(
                  height: 60,
                  width: 60,
                  color: viewModel.selectedMediaIndex ==
                          viewModel.gallery.length - 1
                      ? context.toColor(APPLICATION_COLOR.DARK).withAlpha(60)
                      : context.toColor(APPLICATION_COLOR.DARK),
                  child: Icon(
                    Icons.chevron_right_sharp,
                    color: viewModel.selectedMediaIndex ==
                            viewModel.gallery.length - 1
                        ? context.toColor(APPLICATION_COLOR.LIGHT).withAlpha(60)
                        : context.toColor(APPLICATION_COLOR.LIGHT),
                    size: 56,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Observer(builder: (context) {
              return MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    if (viewModel.selectedMediaIndex != 0) {
                      viewModel.selectedMediaIndexChange(
                          viewModel.selectedMediaIndex - 1);
                      controller.jumpToPage(viewModel.selectedMediaIndex);
                    }
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    color: viewModel.selectedMediaIndex == 0
                        ? context.toColor(APPLICATION_COLOR.DARK).withAlpha(60)
                        : context.toColor(APPLICATION_COLOR.DARK),
                    child: Icon(
                      Icons.chevron_left_sharp,
                      color: viewModel.selectedMediaIndex == 0
                          ? context
                              .toColor(APPLICATION_COLOR.LIGHT)
                              .withAlpha(60)
                          : context.toColor(APPLICATION_COLOR.LIGHT),
                      size: 56,
                    ),
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }

  Widget videoView(GalleryViewModel viewModel) {
    return Stack(
      children: [
        Observer(builder: (context) {
          return VideoFrameView(
              key: Key("${viewModel.gallery[viewModel.selectedMediaIndex].id}"),
              isFullScreen: !viewModel.isBottomVisible,
              fullScreen: () => debugPrint("ontap"),
              url: viewModel.gallery[viewModel.selectedMediaIndex].media.url);
        }),
        Observer(builder: (context) {
          return Padding(
            padding: context.midSpacer,
            child: SafeArea(
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => viewModel.toggleBottomVisible(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LabelText(text: LocaleKeys.allVideos.tr()),
                      Gap(context.midSpacerSize),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: context
                                .toColor(APPLICATION_COLOR.OPPOSITE_COLOR),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: SizedBox(
                          child: Icon(
                            viewModel.isBottomVisible
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                            size: 28,
                            color: context.toColor(APPLICATION_COLOR.GOLD),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
        Observer(builder: (context) {
          if (!viewModel.isBottomVisible ||
              viewModel.selectedMediaIndex == -1) {
            return const SizedBox.shrink();
          }
          return Padding(
            padding: context.midSpacer,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: isTablet() ? 150 : 90,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: viewModel.gallery.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: context.midSpacerOnlyRight,
                            child: MouseRegion(
                              child: GestureDetector(
                                onTap: () =>
                                    viewModel.selectedMediaIndexChange(index),
                                child: isTablet()
                                    ? mediaPart(
                                        viewModel.gallery[index].media
                                            .mediaMetaData.thumbnail,
                                        index == viewModel.selectedMediaIndex,
                                        context)
                                    : littleMediaPart(
                                        viewModel.gallery[index].media
                                            .mediaMetaData.thumbnail,
                                        index == viewModel.selectedMediaIndex,
                                        context),
                              ),
                            ),
                          );
                        })),
                  ),
                ],
              ),
            ),
          );
        }),
        Observer(builder: (context) {
          return Align(
            alignment: Alignment.centerRight,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  debugPrint("test ${viewModel.gallery.length}");
                  if (viewModel.selectedMediaIndex !=
                      viewModel.gallery.length - 1) {
                    viewModel.selectedMediaIndexChange(
                        viewModel.selectedMediaIndex + 1);
                  }
                },
                child: Container(
                  height: 60,
                  width: 60,
                  color: viewModel.selectedMediaIndex ==
                          viewModel.gallery.length - 1
                      ? context.toColor(APPLICATION_COLOR.DARK).withAlpha(60)
                      : context.toColor(APPLICATION_COLOR.DARK),
                  child: Icon(
                    Icons.chevron_right_sharp,
                    color: viewModel.selectedMediaIndex ==
                            viewModel.gallery.length - 1
                        ? context.toColor(APPLICATION_COLOR.LIGHT).withAlpha(60)
                        : context.toColor(APPLICATION_COLOR.LIGHT),
                    size: 56,
                  ),
                ),
              ),
            ),
          );
        }),
        Observer(builder: (context) {
          return Align(
            alignment: Alignment.centerLeft,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  if (viewModel.selectedMediaIndex != 0) {
                    viewModel.selectedMediaIndexChange(
                        viewModel.selectedMediaIndex - 1);
                  }
                },
                child: Container(
                  height: 60,
                  width: 60,
                  color: viewModel.selectedMediaIndex == 0
                      ? context.toColor(APPLICATION_COLOR.DARK).withAlpha(60)
                      : context.toColor(APPLICATION_COLOR.DARK),
                  child: Icon(
                    Icons.chevron_left_sharp,
                    color: viewModel.selectedMediaIndex == 0
                        ? context.toColor(APPLICATION_COLOR.LIGHT).withAlpha(60)
                        : context.toColor(APPLICATION_COLOR.LIGHT),
                    size: 56,
                  ),
                ),
              ),
            ),
          );
        })
      ],
    );
  }

  Widget mediaPart(String imageUrl, bool isSelected, BuildContext context) {
    return Container(
      width: 150 * 1.77777,
      height: 150,
      decoration: BoxDecoration(
        color: context.toColor(APPLICATION_COLOR.DARK),
        border: Border.all(
          width: 2,
          color: context.toColor(
              isSelected ? APPLICATION_COLOR.GOLD : APPLICATION_COLOR.LIGHT),
        ),
      ),
      child: Center(
        child: NormalNetworkImage(
          source: imageUrl,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget littleMediaPart(
      String imageUrl, bool isSelected, BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 90 * 1.77777,
          height: 90,
          decoration: BoxDecoration(
            color: context.toColor(APPLICATION_COLOR.DARK),
            border: Border.all(
              width: 2,
              color: context.toColor(isSelected
                  ? APPLICATION_COLOR.GOLD
                  : APPLICATION_COLOR.LIGHT),
            ),
          ),
          child: SizedBox(
            width: 90 * 1.77777,
            height: 90,
            child: NormalNetworkImage(
              source: imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              color: context.toColor(APPLICATION_COLOR.GOLD),
              borderRadius: context.largeRadius),
          child: const Icon(Icons.play_arrow),
        )
      ],
    );
  }
}
