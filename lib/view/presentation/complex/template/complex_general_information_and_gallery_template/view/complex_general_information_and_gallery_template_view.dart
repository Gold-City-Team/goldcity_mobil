import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/presentation/complex/template/complex_general_information_and_gallery_template/view_model/complex_general_information_and_gallery_template_view_model.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class ComplexGeneralInformationAndGalleryTemplateView extends StatelessWidget {
  final int complexDetailId;
  final int complexSettingsId;
  const ComplexGeneralInformationAndGalleryTemplateView(
      {required this.complexDetailId,
      required this.complexSettingsId,
      super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ComplexGeneralInformationAndGalleryTemplateViewModel>(
      viewModel: ComplexGeneralInformationAndGalleryTemplateViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.complexDetailId = complexDetailId;
        model.complexSettingsId = complexSettingsId;
        model.init();
      },
      onPageBuilder: (BuildContext context,
              ComplexGeneralInformationAndGalleryTemplateViewModel value) =>
          Scaffold(
        body: SingleChildScrollView(
            child: isTablet()
                ? SafeArea(
                    top: false, bottom: true, child: tabletView(context, value))
                : phoneView(context, value)),
      ),
    );
  }

  Widget phoneView(BuildContext context,
      ComplexGeneralInformationAndGalleryTemplateViewModel value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Observer(builder: (context) {
              if (value.templateTwo == null) {
                return const SizedBox.shrink();
              }
              return SizedBox(
                width: context.sWidth,
                height: context.sWidth / 1.7777,
                child: NormalNetworkImage(
                    source: value.templateTwo!.mediaItem.url,
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
          if (value.templateTwo == null) {
            return const SizedBox.shrink();
          }
          return Padding(
            padding: context.largeSpacerOnlyHorizontal,
            child: LabelText(
              text: value.templateTwo!.title,
              fontSize: FONT_SIZE.HEADLINE_LARGE,
            ),
          ).animate().fade();
        }),
        Gap(context.largeSpacerSize),
        Observer(builder: (context) {
          if (value.templateTwo == null) {
            return const SizedBox.shrink();
          }
          return Padding(
            padding: context.largeSpacerOnlyHorizontal,
            child: LabelText(
              text: value.templateTwo!.description,
              fontSize: FONT_SIZE.LABEL_LARGE,
              textColor: APPLICATION_COLOR.SUBTITLE,
            ),
          ).animate().fade();
        }),
        Gap(context.largeSpacerSize),
        Observer(
          builder: (context) {
            if (value.templateTwo == null) {
              return const SizedBox.shrink();
            }
            return Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 0,
                children: value.templateTwo!.gallery
                    .map(
                      (e) => GestureDetector(
                        onTap: () => value.navigateGallery(
                          value.templateTwo!.gallery
                              .indexWhere((element) => element == e),
                        ),
                        child: Padding(
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
                      ),
                    )
                    .toList(),
              ),
            );
          },
        ),
        Gap(context.veryLargeSpacerOnlyBottom.bottom)
      ],
    );
  }

  Widget tabletView(BuildContext context,
      ComplexGeneralInformationAndGalleryTemplateViewModel value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Observer(builder: (context) {
              if (value.templateTwo == null) {
                return const SizedBox.shrink();
              }
              return value.templateTwo!.metaData.mainImagePosition == "left"
                  ? SizedBox(
                      width: (context.sWidth / 2),
                      height: (context.sWidth / 2) / 1.333333,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Observer(builder: (context) {
                            if (value.templateTwo == null) {
                              return const SizedBox.shrink();
                            }
                            return SizedBox(
                              width: (context.sWidth / 2),
                              height: (context.sWidth / 2) / 1.333333,
                              child: NormalNetworkImage(
                                  fit: BoxFit.cover,
                                  source: value.templateTwo!.mediaItem.url),
                            );
                          }),
                          Positioned(
                            right: 0,
                            child: SizedBox(
                              width: 150,
                              height: (context.sWidth / 2) / 1.333333,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
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
                                            .withAlpha(0),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: SizedBox(
                              width: (context.sWidth / 2),
                              height: 150,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        context.toColor(
                                            APPLICATION_COLOR.BACKGROUND_COLOR),
                                        context
                                            .toColor(APPLICATION_COLOR
                                                .BACKGROUND_COLOR)
                                            .withAlpha(0),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ).animate().slide().fade()
                  : const SizedBox.shrink();
            }),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Observer(builder: (context) {
                    if (value.templateTwo == null) {
                      return const SizedBox.shrink();
                    }
                    return Padding(
                      padding: context.largeSpacerOnlyHorizontal,
                      child: LabelText(
                        text: value.templateTwo!.title,
                        fontSize: FONT_SIZE.HEADLINE_LARGE,
                      ),
                    ).animate().fade();
                  }),
                  Gap(context.largeSpacerSize),
                  Observer(builder: (context) {
                    if (value.templateTwo == null) {
                      return const SizedBox.shrink();
                    }
                    return Padding(
                      padding: context.largeSpacerOnlyHorizontal,
                      child: LabelText(
                        text: value.templateTwo!.description,
                        fontSize: FONT_SIZE.LABEL_LARGE,
                        textColor: APPLICATION_COLOR.SUBTITLE,
                      ),
                    ).animate().fade();
                  }),
                ],
              ),
            ),
            Observer(builder: (context) {
              if (value.templateTwo == null) {
                return const SizedBox.shrink();
              }
              return value.templateTwo!.metaData.mainImagePosition == "right"
                  ? SizedBox(
                      width: (context.sWidth / 2),
                      height: (context.sWidth / 2) / 1.333333,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Observer(builder: (context) {
                            if (value.templateTwo == null) {
                              return const SizedBox.shrink();
                            }
                            return SizedBox(
                              width: (context.sWidth / 2),
                              height: (context.sWidth / 2) / 1.333333,
                              child: NormalNetworkImage(
                                  source: value.templateTwo!.mediaItem.url),
                            );
                          }),
                          Positioned(
                            left: 0,
                            child: SizedBox(
                              width: 150,
                              height: (context.sWidth / 2) / 1.333333,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
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
                                            .withAlpha(0),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: SizedBox(
                              width: (context.sWidth / 2),
                              height: 150,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        context.toColor(
                                            APPLICATION_COLOR.BACKGROUND_COLOR),
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
                            ),
                          ),
                        ],
                      ),
                    ).animate().slide().fade()
                  : const SizedBox.shrink();
            })
          ],
        ),
        Gap(context.veryLargeSpacerSize),
        Observer(
          builder: (context) {
            if (value.templateTwo == null) {
              return const SizedBox.shrink();
            }
            return Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(
                value.templateTwo!.gallery.length,
                (index) => SizedBox(
                  width: context.sWidth / 3 - 20,
                  height: (context.sWidth / 3 - 20) / 1.7777,
                  child: GestureDetector(
                    onTap: () => value.navigateGallery(
                        value.templateTwo!.gallery.indexWhere((element) =>
                            element == value.templateTwo!.gallery[index])),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Container(
                            width: context.sWidth / 3 - 20,
                            height: (context.sWidth / 3 - 20) / 1.7777,
                            color: context.toColor(APPLICATION_COLOR.DARK),
                            child: NormalNetworkImage(
                              fit: BoxFit.cover,
                              source: value.templateTwo!.gallery[index].media
                                          .mediaType ==
                                      MEDIA_TYPE.IMAGE
                                  ? value.templateTwo!.gallery[index].media.url
                                  : value.templateTwo!.gallery[index].media
                                      .mediaMetaData.thumbnail,
                            ),
                          ),
                        )
                            .animate()
                            .fade()
                            .slide(duration: const Duration(milliseconds: 500)),
                        value.templateTwo!.gallery[index].media.mediaType ==
                                MEDIA_TYPE.VIDEO
                            ? Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    color:
                                        context.toColor(APPLICATION_COLOR.GOLD),
                                    borderRadius: context.xLargeRadius),
                                child: const Icon(Icons.play_arrow),
                              )
                            : const SizedBox.shrink()
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        Gap(context.veryLargeSpacerOnlyBottom.bottom)
      ],
    );
  }
}
