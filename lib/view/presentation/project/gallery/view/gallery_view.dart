import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as ma;
import 'package:flutter/services.dart';
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

class GalleryView extends ma.StatefulWidget {
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
  ma.State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends ma.State<GalleryView> {
  final ma.FocusNode _focusNode = ma.FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  GalleryViewModel? modelGlobal;

  ma.KeyEventResult _handleKeyEvent(ma.FocusNode node, KeyEvent event) {
    if (modelGlobal != null && event.runtimeType == KeyUpEvent) {
      if (event.physicalKey == PhysicalKeyboardKey.arrowLeft) {
        modelGlobal!.selectedMediaIndex != 0
            ? {
                modelGlobal!.selectedMediaIndexChange(
                    modelGlobal!.selectedMediaIndex - 1),
                carouselController.jumpToPage(modelGlobal!.selectedMediaIndex)
              }
            : null;
      } else if (event.physicalKey == PhysicalKeyboardKey.arrowRight) {
        modelGlobal!.selectedMediaIndex != modelGlobal!.gallery.length - 1
            ? {
                modelGlobal!.selectedMediaIndexChange(
                    modelGlobal!.selectedMediaIndex + 1),
                carouselController.jumpToPage(modelGlobal!.selectedMediaIndex)
              }
            : null;
      }
    }
    return ma.KeyEventResult.handled;
  }

  ma.ScrollController c = ma.ScrollController();
  late GalleryViewModel v;
  @override
  void initState() {
    super.initState();

    ma.WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!widget.isExperiance) {
        if (v.gallery.first.media.mediaType == MEDIA_TYPE.IMAGE) {
          if (isTablet()) {
            c.jumpTo(v.selectedMediaIndex * (150 * 1.84));
          } else {
            c.animateTo(
              v.selectedMediaIndex * 150,
              duration: const Duration(milliseconds: 300),
              curve: ma.Curves.easeIn,
            );
          }
        }
      }
    });
  }

  @override
  ma.Widget build(ma.BuildContext context) {
    ma.FocusScope.of(context).requestFocus(_focusNode);
    debugPrint("only test init");

    return BaseView<GalleryViewModel>(
      viewModel: GalleryViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.gallery = widget.gallery;
        model.selectedMediaIndex = widget.selectedIndex;
        model.isExperiance = widget.isExperiance;
        model.init();
        modelGlobal = model;
        v = model;
      },
      onPageBuilder: (ma.BuildContext context, GalleryViewModel value) =>
          ma.Scaffold(
        body: ma.Focus(
          focusNode: _focusNode,
          onKeyEvent: _handleKeyEvent,
          child: body(
            value,
            context,
          ),
        ),
      ),
    );
  }

  CarouselController carouselController = CarouselController();
  ma.Widget body(GalleryViewModel viewModel, ma.BuildContext context) {
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

  ma.Widget phoneImageViewExperiance(
      GalleryViewModel viewModel, CarouselController controller) {
    return ma.Center(
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
          return ma.Builder(
            builder: (ma.BuildContext context) {
              return ma.SizedBox(
                width: context.sWidth,
                height: context.sHeight,
                child: NormalNetworkImage(
                  fit: ma.BoxFit.contain,
                  source: i.media.url,
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  ma.Widget phoneImageView(
      GalleryViewModel viewModel, CarouselController controller) {
    return ma.Stack(
      children: [
        ma.Row(
          children: [
            ma.SafeArea(
              right: false,
              top: false,
              bottom: false,
              child: Observer(builder: (context) {
                if (viewModel.selectedMediaIndex == -1) {
                  return const ma.SizedBox.shrink();
                }
                return ma.Container(
                  padding: context.midSpacerOnlyTop,
                  width: 100,
                  child: ma.ListView.builder(
                    padding: ma.EdgeInsets.zero,
                    controller: c,
                    itemCount: viewModel.gallery.length,
                    itemBuilder: (context, index) {
                      return ma.SizedBox(
                        height: 150,
                        width: 100,
                        child: ma.MouseRegion(
                          cursor: ma.SystemMouseCursors.click,
                          child: ma.GestureDetector(
                            onTap: () => {
                              ma.FocusScope.of(context)
                                  .requestFocus(_focusNode),
                              viewModel.selectedMediaIndexChange(index),
                              controller.jumpToPage(index)
                            },
                            child: ma.Padding(
                              padding: context.midSpacerOnlyBottom,
                              child: mediaPart(
                                  viewModel.gallery[index].media.url,
                                  viewModel.selectedMediaIndex == index,
                                  context),
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
            ma.Expanded(
              child: FlutterCarousel(
                options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      c.animateTo(index * 150,
                          duration: const Duration(milliseconds: 300),
                          curve: ma.Curves.easeIn);

                      viewModel.selectedMediaIndexChange(index);
                    },
                    controller: controller,
                    showIndicator: false,
                    initialPage: viewModel.selectedMediaIndex,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    pageSnapping: true),
                items: viewModel.gallery.map((i) {
                  return ma.Builder(
                    builder: (ma.BuildContext context) {
                      return ma.Container(
                        margin: context.midSpacerOnlyHorizontal,
                        width: context.sWidth,
                        child: NormalNetworkImage(
                          fit: ma.BoxFit.contain,
                          source: i.media.url,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        ma.SafeArea(
          child: ma.Padding(
            padding: context.midSpacer,
            child: ma.Align(
              alignment: ma.Alignment.topRight,
              child: ma.MouseRegion(
                cursor: ma.SystemMouseCursors.click,
                child: ma.GestureDetector(
                  onTap: () => context.pop(),
                  child: ma.Container(
                    width: 50,
                    margin: context.largeSpacerOnlyHorizontal,
                    height: 50,
                    decoration: ma.BoxDecoration(
                        color: context.toColor(APPLICATION_COLOR.GOLD),
                        borderRadius: context.midRadius),
                    child: const ma.Icon(ma.Icons.close),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  ma.Widget tabletImageView(
      GalleryViewModel viewModel, CarouselController controller) {
    return ma.SafeArea(
      child: ma.Stack(
        children: [
          ma.Column(
            crossAxisAlignment: ma.CrossAxisAlignment.start,
            children: [
              Gap(context.midSpacerSize),
              ma.Align(
                alignment: ma.Alignment.topRight,
                child: ma.MouseRegion(
                  cursor: ma.SystemMouseCursors.click,
                  child: ma.GestureDetector(
                    onTap: () => context.pop(),
                    child: ma.Container(
                      width: 50,
                      margin: context.largeSpacerOnlyHorizontal,
                      height: 50,
                      decoration: ma.BoxDecoration(
                          color: context.toColor(APPLICATION_COLOR.GOLD),
                          borderRadius: context.midRadius),
                      child: const ma.Icon(ma.Icons.close),
                    ),
                  ),
                ),
              ),
              Gap(context.midSpacerSize),
              ma.Flexible(
                flex: 2,
                child: ma.SizedBox(
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
                      return ma.Builder(
                        builder: (ma.BuildContext context) {
                          return ma.Container(
                            margin: context.midSpacerOnlyHorizontal,
                            width: context.sWidth,
                            child: NormalNetworkImage(
                              fit: ma.BoxFit.contain,
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
                  return const ma.SizedBox.shrink();
                }
                return ma.SizedBox(
                    height: 150,
                    child: ma.ListView.builder(
                      scrollDirection: ma.Axis.horizontal,
                      padding: ma.EdgeInsets.zero,
                      itemCount: viewModel.gallery.length,
                      controller: c,
                      itemBuilder: (context, index) {
                        return ma.MouseRegion(
                          cursor: ma.SystemMouseCursors.click,
                          child: ma.GestureDetector(
                            onTap: () => {
                              ma.FocusScope.of(context)
                                  .requestFocus(_focusNode),
                              viewModel.selectedMediaIndexChange(index),
                              carouselController.jumpToPage(index)
                            },
                            child: ma.Padding(
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
          ma.Align(
            alignment: ma.Alignment.centerRight,
            child: ma.MouseRegion(
              cursor: ma.SystemMouseCursors.click,
              child: ma.GestureDetector(
                onTap: () {
                  ma.FocusScope.of(context).requestFocus(_focusNode);
                  if (viewModel.selectedMediaIndex !=
                      viewModel.gallery.length - 1) {
                    viewModel.selectedMediaIndexChange(
                        viewModel.selectedMediaIndex + 1);
                    controller.jumpToPage(viewModel.selectedMediaIndex);
                  }
                },
                child: ma.Container(
                  height: 60,
                  width: 60,
                  color: viewModel.selectedMediaIndex ==
                          viewModel.gallery.length - 1
                      ? context.toColor(APPLICATION_COLOR.DARK).withAlpha(60)
                      : context.toColor(APPLICATION_COLOR.DARK),
                  child: ma.Icon(
                    ma.Icons.chevron_right_sharp,
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
          ma.Align(
            alignment: ma.Alignment.centerLeft,
            child: Observer(builder: (context) {
              return ma.MouseRegion(
                cursor: ma.SystemMouseCursors.click,
                child: ma.GestureDetector(
                  onTap: () {
                    ma.FocusScope.of(context).requestFocus(_focusNode);

                    if (viewModel.selectedMediaIndex != 0) {
                      viewModel.selectedMediaIndexChange(
                          viewModel.selectedMediaIndex - 1);
                      controller.jumpToPage(viewModel.selectedMediaIndex);
                    }
                  },
                  child: ma.Container(
                    height: 60,
                    width: 60,
                    color: viewModel.selectedMediaIndex == 0
                        ? context.toColor(APPLICATION_COLOR.DARK).withAlpha(60)
                        : context.toColor(APPLICATION_COLOR.DARK),
                    child: ma.Icon(
                      ma.Icons.chevron_left_sharp,
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

  ma.Widget videoView(GalleryViewModel viewModel) {
    return ma.Stack(
      children: [
        Observer(builder: (context) {
          return VideoFrameView(
              key: ma.Key(
                  "${viewModel.gallery[viewModel.selectedMediaIndex].id}"),
              isFullScreen: !viewModel.isBottomVisible,
              fullScreen: () => ma.debugPrint("ontap"),
              url: viewModel.gallery[viewModel.selectedMediaIndex].media.url);
        }),
        Observer(builder: (context) {
          return ma.Padding(
            padding: context.midSpacer,
            child: ma.SafeArea(
              child: ma.MouseRegion(
                cursor: ma.SystemMouseCursors.click,
                child: ma.GestureDetector(
                  onTap: () => {
                    ma.FocusScope.of(context).requestFocus(_focusNode),
                    viewModel.toggleBottomVisible()
                  },
                  child: ma.Row(
                    mainAxisSize: ma.MainAxisSize.min,
                    children: [
                      LabelText(text: LocaleKeys.allVideos.tr()),
                      Gap(context.midSpacerSize),
                      ma.Container(
                        height: 40,
                        width: 40,
                        decoration: ma.BoxDecoration(
                            color: context
                                .toColor(APPLICATION_COLOR.OPPOSITE_COLOR),
                            borderRadius: const ma.BorderRadius.all(
                                ma.Radius.circular(20))),
                        child: ma.SizedBox(
                          child: ma.Icon(
                            viewModel.isBottomVisible
                                ? ma.Icons.arrow_drop_up
                                : ma.Icons.arrow_drop_down,
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
            return const ma.SizedBox.shrink();
          }
          return ma.Padding(
            padding: context.midSpacer,
            child: ma.SafeArea(
              child: ma.Column(
                mainAxisAlignment: ma.MainAxisAlignment.end,
                children: [
                  ma.SizedBox(
                    height: isTablet() ? 150 : 90,
                    child: ma.ListView.builder(
                        scrollDirection: ma.Axis.horizontal,
                        itemCount: viewModel.gallery.length,
                        itemBuilder: ((context, index) {
                          return ma.Padding(
                            padding: context.midSpacerOnlyRight,
                            child: ma.MouseRegion(
                              child: ma.GestureDetector(
                                onTap: () => {
                                  viewModel.selectedMediaIndexChange(index),
                                  ma.FocusScope.of(context)
                                      .requestFocus(_focusNode),
                                },
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
          return ma.Align(
            alignment: ma.Alignment.centerRight,
            child: ma.MouseRegion(
              cursor: ma.SystemMouseCursors.click,
              child: ma.GestureDetector(
                onTap: () {
                  ma.FocusScope.of(context).requestFocus(_focusNode);
                  ma.debugPrint("test ${viewModel.gallery.length}");
                  if (viewModel.selectedMediaIndex !=
                      viewModel.gallery.length - 1) {
                    viewModel.selectedMediaIndexChange(
                        viewModel.selectedMediaIndex + 1);
                  }
                },
                child: ma.Container(
                  height: 60,
                  width: 60,
                  color: viewModel.selectedMediaIndex ==
                          viewModel.gallery.length - 1
                      ? context.toColor(APPLICATION_COLOR.DARK).withAlpha(60)
                      : context.toColor(APPLICATION_COLOR.DARK),
                  child: ma.Icon(
                    ma.Icons.chevron_right_sharp,
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
          return ma.Align(
            alignment: ma.Alignment.centerLeft,
            child: ma.MouseRegion(
              cursor: ma.SystemMouseCursors.click,
              child: ma.GestureDetector(
                onTap: () {
                  ma.FocusScope.of(context).requestFocus(_focusNode);
                  if (viewModel.selectedMediaIndex != 0) {
                    viewModel.selectedMediaIndexChange(
                        viewModel.selectedMediaIndex - 1);
                  }
                },
                child: ma.Container(
                  height: 60,
                  width: 60,
                  color: viewModel.selectedMediaIndex == 0
                      ? context.toColor(APPLICATION_COLOR.DARK).withAlpha(60)
                      : context.toColor(APPLICATION_COLOR.DARK),
                  child: ma.Icon(
                    ma.Icons.chevron_left_sharp,
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

  ma.Widget mediaPart(
      String imageUrl, bool isSelected, ma.BuildContext context) {
    return ma.Container(
      width: 150 * 1.77777,
      height: 150,
      decoration: ma.BoxDecoration(
        color: context.toColor(APPLICATION_COLOR.DARK),
        border: ma.Border.all(
          width: 2,
          color: context.toColor(
              isSelected ? APPLICATION_COLOR.GOLD : APPLICATION_COLOR.LIGHT),
        ),
      ),
      child: ma.Center(
        child: NormalNetworkImage(
          source: imageUrl,
          fit: ma.BoxFit.contain,
        ),
      ),
    );
  }

  ma.Widget littleMediaPart(
      String imageUrl, bool isSelected, ma.BuildContext context) {
    return ma.Stack(
      alignment: ma.Alignment.center,
      children: [
        ma.Container(
          width: 90 * 1.77777,
          height: 90,
          decoration: ma.BoxDecoration(
            color: context.toColor(APPLICATION_COLOR.DARK),
            border: ma.Border.all(
              width: 2,
              color: context.toColor(isSelected
                  ? APPLICATION_COLOR.GOLD
                  : APPLICATION_COLOR.LIGHT),
            ),
          ),
          child: ma.SizedBox(
            width: 90 * 1.77777,
            height: 90,
            child: NormalNetworkImage(
              source: imageUrl,
              fit: ma.BoxFit.cover,
            ),
          ),
        ),
        ma.Container(
          width: 30,
          height: 30,
          decoration: ma.BoxDecoration(
              color: context.toColor(APPLICATION_COLOR.GOLD),
              borderRadius: context.largeRadius),
          child: const ma.Icon(ma.Icons.play_arrow),
        )
      ],
    );
  }
}
