import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/config/language/locale_keys.g.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/presentation/complex/template/complex_gallery_and_info_template/view_model/complex_gallery_and_info_template_view_model.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class ComplexGalleryAndInfoTemplate extends StatelessWidget {
  const ComplexGalleryAndInfoTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ComplexGalleryAndInfoTemplateViewModel>(
      viewModel: ComplexGalleryAndInfoTemplateViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context,
              ComplexGalleryAndInfoTemplateViewModel value) =>
          Scaffold(
        body:
            isTablet() ? tabletView(context, value) : phoneView(context, value),
      ),
    );
  }

  Widget tabletView(
      BuildContext context, ComplexGalleryAndInfoTemplateViewModel viewModel) {
    return Stack(
      children: [
        Observer(builder: (context) {
          if (viewModel.templateTwo == null) {
            return const SizedBox.shrink();
          }
          return SizedBox(
            width: context.sWidth,
            height: context.sHeight,
            child: NormalNetworkImage(
              source: viewModel.templateTwo!.mediaItem.url,
              fit: BoxFit.cover,
            ),
          );
        }),
        Row(
          children: [
            Container(
              color: context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
              width: context.sWidth / 2.5,
              height: context.sHeight,
            ).animate().fade(duration: const Duration(milliseconds: 1100)),
            Container(
              color: context
                  .toColor(APPLICATION_COLOR.BACKGROUND_COLOR)
                  .withAlpha(200),
              width: context.sWidth / 15,
              height: context.sHeight,
            ).animate().fade(duration: const Duration(milliseconds: 800)),
            Container(
              color: context
                  .toColor(APPLICATION_COLOR.BACKGROUND_COLOR)
                  .withAlpha(150),
              width: context.sWidth / 15,
              height: context.sHeight,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              ),
            ).animate().fade(duration: const Duration(milliseconds: 500))
          ],
        ),
        Container(
          padding: context.xlargeSpacerOnlyLeft,
          width: context.sWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Observer(builder: (context) {
                if (viewModel.templateTwo == null) {
                  return const SizedBox.shrink();
                }
                return SizedBox(
                  width: context.sWidth / 2.1,
                  child: LabelText(
                    text: viewModel.templateTwo!.title,
                    fontSize: FONT_SIZE.DISPLAY_LARGE,
                  )
                      .animate()
                      .fade(duration: const Duration(milliseconds: 1100))
                      .slideX(
                          begin: 1,
                          curve: Curves.easeIn,
                          duration: const Duration(milliseconds: 1100)),
                );
              }),
              Gap(context.largeSpacerSize),
              Observer(builder: (context) {
                if (viewModel.templateTwo == null) {
                  return const SizedBox.shrink();
                }
                return SizedBox(
                  width: context.sWidth / 2.1,
                  child: LabelText(
                    text: viewModel.templateTwo!.description,
                    fontSize: FONT_SIZE.TITLE_LARGE,
                    textColor: APPLICATION_COLOR.SUBTITLE,
                    overflow: TextOverflow.clip,
                    maxLines: 5,
                  )
                      .animate()
                      .fade(duration: const Duration(milliseconds: 1100))
                      .slideX(
                          begin: -1,
                          duration: const Duration(milliseconds: 1100)),
                );
              }),
              Gap(context.veryLargeSpacerSize),
              Container(
                  height: 175,
                  margin: context.largeSpacerOnlyRight,
                  width: context.sWidth,
                  child: Row(children: [
                    LabelText(
                      text: LocaleKeys.gallery.tr(),
                      fontSize: FONT_SIZE.DISPLAY_SMALL,
                      textColor: APPLICATION_COLOR.TITLE,
                    )
                        .animate()
                        .fade(duration: const Duration(milliseconds: 1100)),
                    Gap(context.largeSpacerSize),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: context.midRadius,
                        child: Stack(
                          children: [
                            Observer(builder: (context) {
                              if (viewModel.templateTwo == null) {
                                return const SizedBox.shrink();
                              }
                              return ListView.builder(
                                  itemCount:
                                      viewModel.templateTwo!.gallery.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () => viewModel.navigateGallery(
                                          viewModel.templateTwo!.gallery
                                              .indexWhere((element) =>
                                                  element ==
                                                  viewModel.templateTwo!
                                                      .gallery[index])),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            margin: index !=
                                                    viewModel.templateTwo!
                                                            .gallery.length -
                                                        1
                                                ? context.midSpacerOnlyRight
                                                : EdgeInsets.zero,
                                            width: 175 * 1.777,
                                            height: 175,
                                            child: ClipRRect(
                                              borderRadius: context.midRadius,
                                              child: NormalNetworkImage(
                                                fit: BoxFit.cover,
                                                source: viewModel
                                                            .templateTwo!
                                                            .gallery[index]
                                                            .media
                                                            .mediaType ==
                                                        MEDIA_TYPE.IMAGE
                                                    ? viewModel
                                                        .templateTwo!
                                                        .gallery[index]
                                                        .media
                                                        .url
                                                    : viewModel
                                                        .templateTwo!
                                                        .gallery[index]
                                                        .media
                                                        .mediaMetaData
                                                        .thumbnail,
                                              ),
                                            ),
                                          )
                                              .animate()
                                              .fade(
                                                  duration: const Duration(
                                                      milliseconds: 1100))
                                              .slideX(
                                                  begin: 1,
                                                  duration: const Duration(
                                                      milliseconds: 500)),
                                          viewModel.templateTwo!.gallery[index]
                                                      .media.mediaType ==
                                                  MEDIA_TYPE.VIDEO
                                              ? Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      color: context.toColor(
                                                          APPLICATION_COLOR
                                                              .GOLD),
                                                      borderRadius:
                                                          context.largeRadius),
                                                  child: const Icon(
                                                      Icons.play_arrow),
                                                )
                                              : const SizedBox.shrink()
                                        ],
                                      ),
                                    );
                                  });
                            }),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 60,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      context.toColor(
                                          APPLICATION_COLOR.BACKGROUND_COLOR),
                                      context
                                          .toColor(APPLICATION_COLOR
                                              .BACKGROUND_COLOR)
                                          .withAlpha(170),
                                      context
                                          .toColor(APPLICATION_COLOR
                                              .BACKGROUND_COLOR)
                                          .withAlpha(0),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 60,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft,
                                    colors: [
                                      context.toColor(
                                          APPLICATION_COLOR.BACKGROUND_COLOR),
                                      context
                                          .toColor(APPLICATION_COLOR
                                              .BACKGROUND_COLOR)
                                          .withAlpha(200),
                                      context
                                          .toColor(APPLICATION_COLOR
                                              .BACKGROUND_COLOR)
                                          .withAlpha(100),
                                      context
                                          .toColor(APPLICATION_COLOR
                                              .BACKGROUND_COLOR)
                                          .withAlpha(0),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]))
            ],
          ),
        ),
      ],
    );
  }

  Widget phoneView(
      BuildContext context, ComplexGalleryAndInfoTemplateViewModel viewModel) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Observer(builder: (context) {
                if (viewModel.templateTwo == null) {
                  return const SizedBox.shrink();
                }
                return SizedBox(
                  width: context.sWidth,
                  height: context.sWidth / 1.7777,
                  child: NormalNetworkImage(
                      source: viewModel.templateTwo!.mediaItem.url,
                      fit: BoxFit.cover),
                );
              }),
              Container(
                width: context.sWidth,
                height: context.sWidth / 1.7777,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      tileMode: TileMode.clamp),
                ),
              ),
            ],
          ).animate().fade(),
          Gap(context.largeSpacerSize),
          Observer(builder: (context) {
            if (viewModel.templateTwo == null) {
              return const SizedBox.shrink();
            }
            return Padding(
              padding: context.largeSpacerOnlyHorizontal,
              child: LabelText(
                text: viewModel.templateTwo!.title,
                fontSize: FONT_SIZE.HEADLINE_LARGE,
              ),
            ).animate().fade();
          }),
          Gap(context.largeSpacerSize),
          Observer(builder: (context) {
            if (viewModel.templateTwo == null) {
              return const SizedBox.shrink();
            }
            return Padding(
              padding: context.largeSpacerOnlyHorizontal,
              child: LabelText(
                text: viewModel.templateTwo!.description,
                fontSize: FONT_SIZE.LABEL_LARGE,
                textColor: APPLICATION_COLOR.SUBTITLE,
              ),
            ).animate().fade();
          }),
          Gap(context.largeSpacerSize),
          Observer(builder: (context) {
            if (viewModel.templateTwo == null) {
              return const SizedBox.shrink();
            }
            return Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 0,
                children: viewModel.templateTwo!.gallery
                    .map(
                      (e) => Padding(
                        padding: context.midSpacerOnlyBottom,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: (context.sWidth / 2) - 20,
                              height: ((context.sWidth / 2) - 20) / 1.7777,
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
              ),
            );
          }),
          Gap(context.veryLargeSpacerOnlyBottom.bottom)
        ],
      ),
    );
  }
}
