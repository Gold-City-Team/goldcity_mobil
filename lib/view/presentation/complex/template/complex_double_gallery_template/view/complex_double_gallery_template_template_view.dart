import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/presentation/complex/template/complex_double_gallery_template/view_model/complex_double_gallery_template_view_model.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class ComplexDoubleGalleryTemplateView extends StatelessWidget {
  final int detailId;
  final int settingsId;
  const ComplexDoubleGalleryTemplateView(
      {required this.detailId, required this.settingsId, super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ComplexDoubleGalleryTemplateViewModel>(
      viewModel: ComplexDoubleGalleryTemplateViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.detailId = detailId;
        model.settingsId = settingsId;
        model.init();
      },
      onPageBuilder:
          (BuildContext context, ComplexDoubleGalleryTemplateViewModel value) =>
              Scaffold(
        body: isTablet()
            ? tabletView(context, value)
            : telephoneView(context, value),
      ),
    );
  }

  Widget telephoneView(
      BuildContext context, ComplexDoubleGalleryTemplateViewModel value) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: context.sWidth,
            child: Stack(
              children: [
                Observer(builder: (context) {
                  if (value.templateEntity == null) {
                    return const SizedBox.shrink();
                  }
                  return SizedBox(
                    width: context.sWidth,
                    child: Observer(builder: (context) {
                      return NormalNetworkImage(
                          source: value.templateEntity!.mediaItem.url);
                    }),
                  );
                }),
                Positioned(
                  bottom: 0,
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
            if (value.templateEntity == null) {
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
                    text: value.templateEntity!.title,
                    fontSize: FONT_SIZE.HEADLINE_LARGE,
                  ),
                  LabelText(
                    text: value.templateEntity!.description,
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
            if (value.templateEntity == null) {
              return const SizedBox.shrink();
            }
            return SizedBox(
              height: 150,
              child: Container(
                color: context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
                child: ListView.builder(
                    itemCount: value.templateEntity!.gallery.length,
                    padding: context.largeSpacerOnlyHorizontal,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => value.navigateGallery(index, false),
                        child: Container(
                            width: 150 * 1.7777,
                            height: 150,
                            margin: value.templateEntity!.gallery.length - 1 !=
                                    index
                                ? context.largeSpacerOnlyRight
                                : EdgeInsets.zero,
                            child:
                                Stack(alignment: Alignment.center, children: [
                              SizedBox(
                                width: 150 * 1.7777,
                                height: 150,
                                child: NormalNetworkImage(
                                    fit: BoxFit.cover,
                                    source: value.templateEntity!.gallery[index]
                                                .media.mediaType ==
                                            MEDIA_TYPE.VIDEO
                                        ? value.templateEntity!.gallery[index]
                                            .media.mediaMetaData.thumbnail
                                        : value.templateEntity!.gallery[index]
                                            .media.url),
                              ),
                              value.templateEntity!.gallery[index].media
                                          .mediaType ==
                                      MEDIA_TYPE.VIDEO
                                  ? Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: context
                                              .toColor(APPLICATION_COLOR.GOLD),
                                          borderRadius: context.largeRadius),
                                      child: const Icon(Icons.play_arrow),
                                    )
                                  : const SizedBox.shrink()
                            ])),
                      );
                    }),
              ),
            );
          }),
          Gap(context.midSpacerSize),
          Padding(
            padding: context.largeSpacerOnlyHorizontal,
            child: const LabelText(
                text: "Galeri", fontSize: FONT_SIZE.HEADLINE_LARGE),
          ),
          Gap(context.midSpacerSize),
          Padding(
            padding: context.largeSpacerOnlyHorizontal,
            child: Observer(
              builder: (context) {
                if (value.templateEntity == null) {
                  return const SizedBox.shrink();
                }
                return Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  runAlignment: WrapAlignment.center,
                  runSpacing: 10,
                  children: value.templateEntity!.gallery
                      .map(
                        (e) => GestureDetector(
                          onTap: () => value.navigateGallery(
                              value.templateEntity!.gallery
                                  .indexWhere((element) => element == e),
                              true),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: (context.sWidth / 2) - 20,
                                height: ((context.sWidth / 2) * 1.7777) - 20,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Container(
                                    color:
                                        context.toColor(APPLICATION_COLOR.DARK),
                                    child: NormalNetworkImage(
                                      fit: BoxFit.cover,
                                      source:
                                          e.media.mediaType == MEDIA_TYPE.IMAGE
                                              ? e.media.url
                                              : e.media.mediaMetaData.thumbnail,
                                    ),
                                  ),
                                ).animate().fade(),
                              ),
                              e.media.mediaType == MEDIA_TYPE.VIDEO
                                  ? Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: context
                                              .toColor(APPLICATION_COLOR.GOLD),
                                          borderRadius: context.largeRadius),
                                      child: const Icon(Icons.play_arrow),
                                    )
                                  : const SizedBox.shrink()
                            ],
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

  Widget tabletView(
      BuildContext context, ComplexDoubleGalleryTemplateViewModel value) {
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
                      width: context.sWidth / 1.3,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Observer(builder: (context) {
                            if (value.templateEntity == null) {
                              return const SizedBox.shrink();
                            }
                            return SizedBox(
                              width: context.sWidth / 1.3,
                              height: context.sHeight / 1.5,
                              child: NormalNetworkImage(
                                  source: value.templateEntity!.mediaItem.url),
                            );
                          }),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: context.sWidth / 1.3,
                              height: context.sHeight / 1.5,
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
                  Positioned(
                    bottom: 40,
                    right: 0,
                    child: SizedBox(
                      height: 170,
                      width: context.sWidth / 2,
                      child: Container(
                        width: 150,
                        color:
                            context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
                        child: Observer(builder: (context) {
                          if (value.templateEntity == null) {
                            return const SizedBox.shrink();
                          }
                          return SizedBox(
                            height: (context.sWidth / 1.85) / 1.7777,
                            child: Container(
                              color: context
                                  .toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
                              child: ListView.builder(
                                  itemCount:
                                      value.templateEntity!.gallery.length,
                                  padding: context.largeSpacerOnlyHorizontal,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () =>
                                          value.navigateGallery(index, true),
                                      child: Container(
                                        width: 150 * 1.7777,
                                        height: 150,
                                        margin: value.templateEntity!.gallery
                                                        .length -
                                                    1 !=
                                                index
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
                                                  source: value
                                                              .templateEntity!
                                                              .gallery[index]
                                                              .media
                                                              .mediaType ==
                                                          MEDIA_TYPE.VIDEO
                                                      ? value
                                                          .templateEntity!
                                                          .gallery[index]
                                                          .media
                                                          .mediaMetaData
                                                          .thumbnail
                                                      : value
                                                          .templateEntity!
                                                          .gallery[index]
                                                          .media
                                                          .url),
                                            ),
                                            value.templateEntity!.gallery[index]
                                                        .media.mediaType ==
                                                    MEDIA_TYPE.VIDEO
                                                ? Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        color: context.toColor(
                                                            APPLICATION_COLOR
                                                                .GOLD),
                                                        borderRadius: context
                                                            .largeRadius),
                                                    child: const Icon(
                                                        Icons.play_arrow),
                                                  )
                                                : const SizedBox.shrink()
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  Observer(builder: (context) {
                    if (value.templateEntity == null) {
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
                            text: value.templateEntity!.title,
                            fontSize: FONT_SIZE.DISPLAY_LARGE,
                          ),
                          LabelText(
                            text: value.templateEntity!.description,
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
            child: const LabelText(
                text: "Galeri", fontSize: FONT_SIZE.DISPLAY_LARGE),
          ),
          Gap(context.midSpacerSize),
          Padding(
            padding: context.largeSpacerOnlyHorizontal,
            child: Observer(
              builder: (context) {
                if (value.templateEntity == null) {
                  return const SizedBox.shrink();
                }
                return Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  runAlignment: WrapAlignment.center,
                  runSpacing: 10,
                  children: value.templateEntity!.gallery
                      .map(
                        (e) => GestureDetector(
                          onTap: () => value.navigateGallery(
                              value.templateEntity!.gallery
                                  .indexWhere((element) => element == e),
                              true),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: (context.sWidth / 3) - 20,
                                height: ((context.sWidth / 3) * 1.7777) - 20,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Container(
                                    color:
                                        context.toColor(APPLICATION_COLOR.DARK),
                                    child: NormalNetworkImage(
                                      fit: BoxFit.cover,
                                      source:
                                          e.media.mediaType == MEDIA_TYPE.IMAGE
                                              ? e.media.url
                                              : e.media.mediaMetaData.thumbnail,
                                    ),
                                  ),
                                ).animate().fade(),
                              ),
                              e.media.mediaType == MEDIA_TYPE.VIDEO
                                  ? Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: context
                                              .toColor(APPLICATION_COLOR.GOLD),
                                          borderRadius: context.largeRadius),
                                      child: const Icon(Icons.play_arrow),
                                    )
                                  : const SizedBox.shrink()
                            ],
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
