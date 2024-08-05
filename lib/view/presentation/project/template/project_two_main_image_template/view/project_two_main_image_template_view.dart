import 'dart:ui';

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
import 'package:goldcity/view/presentation/project/template/project_two_main_image_template/view_model/project_two_main_image_template_view_model.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class ProjectTwoMainImageTemplateView extends StatelessWidget {
  final int projectSettingsId;
  const ProjectTwoMainImageTemplateView(
      {required this.projectSettingsId, super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProjectTwoMainImageTemplateViewModel>(
      viewModel: ProjectTwoMainImageTemplateViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.projectSettingsId = projectSettingsId;
        model.init();
      },
      onPageBuilder:
          (BuildContext context, ProjectTwoMainImageTemplateViewModel value) =>
              Scaffold(
        body: SingleChildScrollView(
          child: isTablet()
              ? tabletView(context, value)
              : phoneView(context, value),
        ),
      ),
    );
  }

  Widget phoneView(
      BuildContext context, ProjectTwoMainImageTemplateViewModel value) {
    return SafeArea(
      child: Observer(builder: (context) {
        if (value.templateTwo == null) {
          return const SizedBox.shrink();
        }
        return Padding(
          padding: context.largeSpacerOnlyHorizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabelText(
                text: value.templateTwo!.title,
                maxLines: 1,
                fontSize: FONT_SIZE.HEADLINE_LARGE,
                textLineHeight: 1,
              ),
              Gap(context.midSpacerSize),
              SizedBox(
                child: Center(
                  child: LabelText(
                    text: value.templateTwo!.description,
                    maxLines: 10,
                    textColor: APPLICATION_COLOR.SUBTITLE,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ),
              SizedBox(
                height: context.sWidth / 1.77 + 75,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: context.sWidth,
                        height: context.sWidth / 1.78,
                        child: ClipRRect(
                          borderRadius: context.midRadius,
                          child: SizedBox(
                            width: context.sWidth,
                            height: context.sWidth / 1.78,
                            child: NormalNetworkImage(
                                source: value.templateTwo!.mediaItem.url),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: context.sWidth,
                        height: context.sWidth / 1.75,
                        child: ClipRRect(
                          borderRadius: context.midRadius,
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                            child: Container(
                              width: context.sWidth,
                              height: context.sWidth / 1.75,
                              color: context
                                  .toColor(APPLICATION_COLOR.DARK)
                                  .withOpacity(.4),
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: context.sWidth,
                      padding: context.largeSpacer,
                      height: context.sWidth / 1.78,
                      child: ClipRRect(
                        borderRadius: context.midRadius,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                            width: context.sWidth,
                            height: context.sWidth / 1.78,
                            child: NormalNetworkImage(
                                source: value.templateTwo!.mediaItem.url),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(context.midSpacerSize),
              Observer(
                builder: (context) {
                  if (value.templateTwo == null) {
                    return const SizedBox.shrink();
                  }
                  return ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: value.templateTwo!.gallery.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: index == value.templateTwo!.gallery.length - 1
                              ? EdgeInsets.zero
                              : context.midSpacerOnlyBottom,
                          width: context.sWidth,
                          height: (context.sWidth) / 1.7777,
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () => value.navigateGallery(value
                                  .templateTwo!.gallery
                                  .indexWhere((element) =>
                                      element ==
                                      value.templateTwo!.gallery[index])),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Container(
                                      width: context.sWidth,
                                      height: (context.sWidth) / 1.7777,
                                      color: context
                                          .toColor(APPLICATION_COLOR.DARK),
                                      child: NormalNetworkImage(
                                        fit: BoxFit.cover,
                                        source: value
                                                    .templateTwo!
                                                    .gallery[index]
                                                    .media
                                                    .mediaType ==
                                                MEDIA_TYPE.IMAGE
                                            ? value.templateTwo!.gallery[index]
                                                .media.url
                                            : value.templateTwo!.gallery[index]
                                                .media.mediaMetaData.thumbnail,
                                      ),
                                    ),
                                  ).animate().fade().slide(
                                      duration:
                                          const Duration(milliseconds: 500)),
                                  value.templateTwo!.gallery[index].media
                                              .mediaType ==
                                          MEDIA_TYPE.VIDEO
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
                        );
                      });
                },
              ),
              Gap(context.veryLargeSpacerOnlyBottom.bottom)
            ],
          ),
        );
      }),
    );
  }

  Widget tabletView(
      BuildContext context, ProjectTwoMainImageTemplateViewModel value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: (context.sHeight / 100) * 85,
          child: Observer(builder: (context) {
            if (value.templateTwo == null) {
              return const SizedBox.shrink();
            }
            return value.templateTwo!.metaData.mainImagePosition == "right"
                ? Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: context.sWidth / 2.2,
                          height: (context.sHeight / 100) * 85,
                          child: NormalNetworkImage(
                              source: value.templateTwo!.mediaItem.url),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                            child: Container(
                              width: context.sWidth / 2.2,
                              height: (context.sHeight / 100) * 85,
                              color: context
                                  .toColor(APPLICATION_COLOR.DARK)
                                  .withOpacity(.4),
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: context.largeSpacer,
                                width: context.sWidth / 2.5,
                                height: (context.sHeight / 100) * 85,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Spacer(),
                                    LabelText(
                                      text: value.templateTwo!.title,
                                      maxLines: 1,
                                      fontSize: FONT_SIZE.DISPLAY_MEDIUM,
                                    ),
                                    Gap(context.largeSpacerSize),
                                    LabelText(
                                      text: value.templateTwo!.description,
                                      maxLines: 10,
                                      textColor: APPLICATION_COLOR.SUBTITLE,
                                      fontSize: FONT_SIZE.TITLE_MEDIUM,
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Gap(context.xlargeSpacerSize),
                          ClipRRect(
                            borderRadius: context.midRadius,
                            child: SizedBox(
                              width: (context.sWidth / 2.1),
                              height: (context.sWidth / 2.1) / 1.7777,
                              child: NormalNetworkImage(
                                  source: value.templateTwo!.mediaItem.url),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: context.sWidth / 2.2,
                          height: (context.sHeight / 100) * 85,
                          child: NormalNetworkImage(
                              source: value.templateTwo!.mediaItem.url),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                            child: Container(
                              width: context.sWidth / 2.2,
                              height: (context.sHeight / 100) * 85,
                              color: context
                                  .toColor(APPLICATION_COLOR.DARK)
                                  .withOpacity(.4),
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Padding(
                          padding: context.largeSpacerOnlyRight,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: context.midRadius,
                                child: SizedBox(
                                  width: (context.sWidth / 2.1),
                                  height: (context.sWidth / 2.1) / 1.7777,
                                  child: NormalNetworkImage(
                                      source: value.templateTwo!.mediaItem.url),
                                ),
                              ),
                              Gap(context.xlargeSpacerSize),
                              Container(
                                padding: context.largeSpacer,
                                width: context.sWidth / 2.5,
                                height: (context.sHeight / 100) * 85,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Spacer(),
                                    LabelText(
                                      text: value.templateTwo!.title,
                                      maxLines: 1,
                                      fontSize: FONT_SIZE.DISPLAY_MEDIUM,
                                    ),
                                    Gap(context.largeSpacerSize),
                                    LabelText(
                                      text: value.templateTwo!.description,
                                      maxLines: 10,
                                      textColor: APPLICATION_COLOR.SUBTITLE,
                                      fontSize: FONT_SIZE.TITLE_MEDIUM,
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
          }),
        ),
        Padding(
          padding: context.largeSpacerOnlyHorizontal,
          child: Observer(
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
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
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
                                  source: value.templateTwo!.gallery[index]
                                              .media.mediaType ==
                                          MEDIA_TYPE.IMAGE
                                      ? value
                                          .templateTwo!.gallery[index].media.url
                                      : value.templateTwo!.gallery[index].media
                                          .mediaMetaData.thumbnail,
                                ),
                              ),
                            ).animate().fade().slide(
                                duration: const Duration(milliseconds: 500)),
                            value.templateTwo!.gallery[index].media.mediaType ==
                                    MEDIA_TYPE.VIDEO
                                ? Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: context
                                            .toColor(APPLICATION_COLOR.GOLD),
                                        borderRadius: context.xLargeRadius),
                                    child: const Icon(Icons.play_arrow),
                                  )
                                : const SizedBox.shrink()
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Gap(context.veryLargeSpacerOnlyBottom.bottom)
      ],
    );
  }
}
