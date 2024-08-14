import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/util/constant/general_constant.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/presentation/project/template/project_text_image_template/view_model/project_text_image_template_view_model.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class ProjectTextImageTemplateView extends StatelessWidget {
  final int detailId;
  final int settingsId;
  const ProjectTextImageTemplateView(
      {required this.detailId, required this.settingsId, super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProjectTextImageTemplateViewModel>(
      viewModel: ProjectTextImageTemplateViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.detailId = detailId;
        model.settingsId = settingsId;
        model.init();
      },
      onPageBuilder:
          (BuildContext context, ProjectTextImageTemplateViewModel value) =>
              Scaffold(
        body: SafeArea(
          child: isTablet()
              ? tabletView(context, value)
              : telephoneView(context, value),
        ),
      ),
    );
  }

  Widget telephoneView(
      BuildContext context, ProjectTextImageTemplateViewModel value) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: context.sWidth,
            child: Stack(
              children: [
                SizedBox(
                  width: context.sWidth,
                  child: Observer(builder: (context) {
                    if (value.template == null || value.allImages.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return SizedBox(
                      width: context.sWidth,
                      height: context.sWidth / 1.777,
                      child: NormalNetworkImage(
                              fit: BoxFit.cover,
                              source: value.allImages
                                          .where((element) =>
                                              element.id ==
                                              value.selectedImageGalleryId)
                                          .first
                                          .media
                                          .mediaType ==
                                      MEDIA_TYPE.VIDEO
                                  ? value.allImages
                                      .where((element) =>
                                          element.id ==
                                          value.selectedImageGalleryId)
                                      .first
                                      .media
                                      .mediaMetaData
                                      .thumbnail
                                  : value.allImages
                                      .where((element) =>
                                          element.id ==
                                          value.selectedImageGalleryId)
                                      .first
                                      .media
                                      .url)
                          .animate()
                          .fade(duration: const Duration(seconds: 1)),
                    );
                  }),
                ),
                Positioned(
                  bottom: -1,
                  child: Container(
                    width: context.sWidth,
                    height: (context.sWidth / 1.777) / 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
                          context
                              .toColor(APPLICATION_COLOR.BACKGROUND_COLOR)
                              .withAlpha(200),
                          context
                              .toColor(APPLICATION_COLOR.BACKGROUND_COLOR)
                              .withOpacity(0)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gap(context.midSpacerSize),
          Observer(builder: (context) {
            if (value.template == null ||
                value.description == "" ||
                value.title == "") {
              return const SizedBox.shrink();
            }
            return Container(
              margin: context.largeSpacerOnlyHorizontal,
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LabelText(
                    text: value.title,
                    fontSize: FONT_SIZE.HEADLINE_LARGE,
                  ),
                  LabelText(
                    text: value.description,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                    textColor: APPLICATION_COLOR.SUBTITLE,
                    maxLines: 5,
                  ),
                ],
              ),
            );
          }),
          Gap(context.largeSpacerSize),
          Observer(builder: (context) {
            if (value.template == null ||
                value.miniImages.isEmpty ||
                value.title.isEmpty) {
              return const SizedBox.shrink();
            }
            return SizedBox(
              height: (context.sWidth / 1.85) / 1.7777,
              child: Container(
                color: context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
                child: ListView.builder(
                    cacheExtent: 9999,
                    itemCount: value.miniImages.length,
                    padding: context.largeSpacerOnlyHorizontal,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => value.changeSelectedImageGalleryId(
                              value.miniImages[index].id),
                          child: Container(
                            width: (context.sWidth / 1.85),
                            height: (context.sWidth / 1.85) / 1.7777,
                            margin: value.miniImages.length - 1 != index
                                ? context.midSpacerOnlyRight
                                : EdgeInsets.zero,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width: (context.sWidth / 1.85),
                                  height: (context.sWidth / 1.85) / 1.7777,
                                  child: NormalNetworkImage(
                                      fit: BoxFit.cover,
                                      source: value.miniImages[index].media
                                                  .mediaType ==
                                              MEDIA_TYPE.VIDEO
                                          ? value.miniImages[index].media
                                              .mediaMetaData.thumbnail
                                          : value.miniImages[index].media.url),
                                ),
                                value.title !=
                                        value.getSelectedGallerySetTitle(
                                            value.miniImages[index].id)
                                    ? Container(
                                        color: context
                                            .toColor(APPLICATION_COLOR
                                                .BACKGROUND_COLOR)
                                            .withAlpha(200),
                                      )
                                    : const SizedBox.shrink(),
                                value.title !=
                                        value.getSelectedGallerySetTitle(
                                            value.miniImages[index].id)
                                    ? LabelText(
                                        fontSize: FONT_SIZE.HEADLINE_SMALL,
                                        text: value.getSelectedGallerySetTitle(
                                            value.miniImages[index].id),
                                      )
                                    : const SizedBox.shrink()
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            );
          }),
          Gap(context.midSpacerSize),
          Padding(
            padding: context.largeSpacerOnlyHorizontal,
            child: LabelText(
                text: GeneralConstant.FIELD_NAME["Galleries"],
                fontSize: FONT_SIZE.HEADLINE_LARGE),
          ),
          Gap(context.midSpacerSize),
          Padding(
            padding: context.largeSpacerOnlyHorizontal,
            child: Observer(
              builder: (context) {
                if (value.allImages.isEmpty ||
                    value.description == "" ||
                    value.title == "") {
                  return const SizedBox.shrink();
                }
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.allImages.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: context.sWidth - 20,
                        padding: context.midSpacerOnlyBottom,
                        height: (context.sWidth - 20) / 1.7777,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => value.navigateGallery(
                              value.allImages.indexWhere((element) =>
                                  element == value.allImages[index]),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: SizedBox(
                                    width: context.sWidth,
                                    child: NormalNetworkImage(
                                      fit: BoxFit.cover,
                                      source: value.allImages[index].media
                                                  .mediaType ==
                                              MEDIA_TYPE.IMAGE
                                          ? value.allImages[index].media.url
                                          : value.allImages[index].media
                                              .mediaMetaData.thumbnail,
                                    ),
                                  ),
                                ).animate().fade(),
                                value.allImages[index].media.mediaType ==
                                        MEDIA_TYPE.VIDEO
                                    ? Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: context.toColor(
                                                APPLICATION_COLOR.GOLD),
                                            borderRadius: context.xLargeRadius),
                                        child: const Icon(Icons.play_arrow),
                                      )
                                    : const SizedBox.shrink()
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
            ),
          ),
          Gap(context.veryLargeSpacerOnlyBottom.bottom)
        ],
      ),
    );
  }

  Widget tabletView(
      BuildContext context, ProjectTextImageTemplateViewModel value) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: (context.sHeight / 1.5) + 140,
              width: context.sWidth,
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    child: SizedBox(
                      width: context.sWidth / 1.2,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          SizedBox(
                            width: context.sWidth / 1.3,
                            height: context.sHeight / 1.5,
                            child: Observer(builder: (context) {
                              if (value.template == null ||
                                  value.allImages.isEmpty) {
                                return const SizedBox.shrink();
                              }
                              return NormalNetworkImage(
                                      fit: BoxFit.cover,
                                      source: value.allImages
                                                  .where((element) =>
                                                      element.id ==
                                                      value
                                                          .selectedImageGalleryId)
                                                  .first
                                                  .media
                                                  .mediaType ==
                                              MEDIA_TYPE.VIDEO
                                          ? value.allImages
                                              .where((element) =>
                                                  element.id ==
                                                  value.selectedImageGalleryId)
                                              .first
                                              .media
                                              .mediaMetaData
                                              .thumbnail
                                          : value.allImages
                                              .where((element) =>
                                                  element.id ==
                                                  value.selectedImageGalleryId)
                                              .first
                                              .media
                                              .url)
                                  .animate()
                                  .fade(duration: const Duration(seconds: 1));
                            }),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: context.sWidth / 1,
                              height: context.sHeight / 1.2,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    context.toColor(
                                        APPLICATION_COLOR.BACKGROUND_COLOR),
                                    context
                                        .toColor(
                                            APPLICATION_COLOR.BACKGROUND_COLOR)
                                        .withAlpha(250),
                                    context
                                        .toColor(
                                            APPLICATION_COLOR.BACKGROUND_COLOR)
                                        .withAlpha(200),
                                    context
                                        .toColor(
                                            APPLICATION_COLOR.BACKGROUND_COLOR)
                                        .withOpacity(0)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Observer(builder: (context) {
                    if (value.template == null ||
                        value.miniImages.isEmpty ||
                        value.title.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return Positioned(
                      bottom: 40,
                      right: 0,
                      child: SizedBox(
                        height: 170,
                        width: context.sWidth / 2,
                        child: Container(
                          width: 150,
                          color: context
                              .toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
                          child: ListView.builder(
                              itemCount: value.miniImages.length,
                              padding: context.midSpacerOnlyLeft,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () =>
                                        value.changeSelectedImageGalleryId(
                                            value.miniImages[index].id),
                                    child: Container(
                                      width: 150 * 1.7777,
                                      height: 150,
                                      margin:
                                          value.miniImages.length - 1 != index
                                              ? context.largeSpacerOnlyRight
                                              : EdgeInsets.zero,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          SizedBox(
                                            width: 150 * 1.7777,
                                            height: 150,
                                            child: NormalNetworkImage(
                                                fit: BoxFit.cover,
                                                source: value.miniImages[index]
                                                            .media.mediaType ==
                                                        MEDIA_TYPE.VIDEO
                                                    ? value
                                                        .miniImages[index]
                                                        .media
                                                        .mediaMetaData
                                                        .thumbnail
                                                    : value.miniImages[index]
                                                        .media.url),
                                          ),
                                          value.title !=
                                                  value
                                                      .getSelectedGallerySetTitle(
                                                          value
                                                              .miniImages[index]
                                                              .id)
                                              ? Container(
                                                  color: context
                                                      .toColor(APPLICATION_COLOR
                                                          .BACKGROUND_COLOR)
                                                      .withAlpha(200),
                                                )
                                              : const SizedBox.shrink(),
                                          value.title !=
                                                  value
                                                      .getSelectedGallerySetTitle(
                                                          value
                                                              .miniImages[index]
                                                              .id)
                                              ? LabelText(
                                                  fontSize:
                                                      FONT_SIZE.HEADLINE_SMALL,
                                                  text: value
                                                      .getSelectedGallerySetTitle(
                                                          value
                                                              .miniImages[index]
                                                              .id),
                                                )
                                              : const SizedBox.shrink()
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    );
                  }),
                  Observer(builder: (context) {
                    if (value.template == null ||
                        value.description == "" ||
                        value.title == "") {
                      return const SizedBox.shrink();
                    }
                    return Container(
                      margin: context.xlargeSpacerOnlyLeft,
                      width: context.sWidth / 2.5,
                      alignment: Alignment.center,
                      height: context.sHeight / 1.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LabelText(
                            text: value.title,
                            fontSize: FONT_SIZE.DISPLAY_LARGE,
                          ),
                          LabelText(
                            text: value.description,
                            fontSize: FONT_SIZE.TITLE_LARGE,
                            maxLines: 5,
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              )),
          Padding(
            padding: context.xlargeSpacerOnlyLeft,
            child: LabelText(
                text: GeneralConstant.FIELD_NAME["Galleries"],
                fontSize: FONT_SIZE.DISPLAY_LARGE),
          ),
          Gap(context.midSpacerSize),
          Padding(
            padding: context.largeSpacerOnlyHorizontal,
            child: Observer(
              builder: (context) {
                if (value.allImages.isEmpty ||
                    value.description == "" ||
                    value.title == "") {
                  return const SizedBox.shrink();
                }
                return Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: value.allImages
                      .map(
                        (e) => SizedBox(
                          width: context.sWidth / 3 - 20,
                          height: (context.sWidth / 3 - 20) / 1.7777,
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () => value.navigateGallery(
                                value.allImages
                                    .indexWhere((element) => element == e),
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Container(
                                      width: context.sWidth / 3 - 20,
                                      height:
                                          (context.sWidth / 3 - 20) / 1.7777,
                                      color: context
                                          .toColor(APPLICATION_COLOR.DARK),
                                      child: NormalNetworkImage(
                                        fit: BoxFit.cover,
                                        source: e.media.mediaType ==
                                                MEDIA_TYPE.IMAGE
                                            ? e.media.url
                                            : e.media.mediaMetaData.thumbnail,
                                      ),
                                    ),
                                  ).animate().fade(),
                                  e.media.mediaType == MEDIA_TYPE.VIDEO
                                      ? Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: context.toColor(
                                                  APPLICATION_COLOR.GOLD),
                                              borderRadius:
                                                  context.xLargeRadius),
                                          child: const Icon(Icons.play_arrow),
                                        )
                                      : const SizedBox.shrink()
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
          Gap(context.veryLargeSpacerOnlyBottom.bottom)
        ],
      ),
    );
  }
}
