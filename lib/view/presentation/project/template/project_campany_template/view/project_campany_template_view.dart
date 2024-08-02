import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/presentation/project/template/project_campany_template/view_model/project_campany_template_view_model.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class ProjectCampanyTemplateView extends StatelessWidget {
  final int projectSettingsId;
  const ProjectCampanyTemplateView(
      {required this.projectSettingsId, super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProjectCampanyTemplateViewModel>(
      viewModel: ProjectCampanyTemplateViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.projectSettingsId = projectSettingsId;
        model.init();
      },
      onPageBuilder:
          (BuildContext context, ProjectCampanyTemplateViewModel value) =>
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
      BuildContext context, ProjectCampanyTemplateViewModel value) {
    return SafeArea(
      child: Observer(builder: (context) {
        if (value.templateNine == null) {
          return const SizedBox.shrink();
        }
        return Padding(
          padding: context.largeSpacerOnlyHorizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.sWidth / 1.333 + 85,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: context.sWidth,
                        height: context.sWidth / 1.33,
                        child: ClipRRect(
                          borderRadius: context.midRadius,
                          child: SizedBox(
                            width: context.sWidth,
                            height: context.sWidth / 1.33,
                            child: NormalNetworkImage(
                                fit: BoxFit.cover,
                                source: value
                                    .templateNine!
                                    .campaigns[value.selectedIndex]
                                    .mainImage
                                    .url),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: context.sWidth,
                        height: context.sWidth / 1.33,
                        child: ClipRRect(
                          borderRadius: context.midRadius,
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                            child: Container(
                              width: context.sWidth,
                              height: context.sWidth / 1.33,
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
                      height: context.sWidth / 1.33,
                      child: ClipRRect(
                        borderRadius: context.midRadius,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                            width: context.sWidth,
                            height: context.sWidth / 1.33,
                            child: NormalNetworkImage(
                                source: value
                                    .templateNine!
                                    .campaigns[value.selectedIndex]
                                    .mainImage
                                    .url),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(context.largeSpacerSize),
              Observer(
                builder: (context) {
                  if (value.templateNine == null) {
                    return const SizedBox.shrink();
                  }
                  return SizedBox(
                    height: 150,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: value.templateNine!.campaigns.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () => value.changeSelectedIndex(index),
                              child: Container(
                                height: 150,
                                width: 199.95,
                                decoration: BoxDecoration(
                                    border: value.selectedIndex == index
                                        ? Border.all(
                                            color: context.toColor(
                                                APPLICATION_COLOR.GOLD))
                                        : null),
                                child: NormalNetworkImage(
                                    fit: BoxFit.contain,
                                    source: value.templateNine!.campaigns[index]
                                        .mainImage.url),
                              ),
                            ),
                            Gap(context.largeSpacerSize)
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
              Gap(context.largeSpacerSize),
              LabelText(
                text: value.templateNine!.campaigns[value.selectedIndex].title,
                maxLines: 1,
                fontSize: FONT_SIZE.HEADLINE_LARGE,
                textLineHeight: 1,
              ),
              Gap(context.midSpacerSize),
              SizedBox(
                child: Center(
                  child: LabelText(
                    text: value.templateNine!.campaigns[value.selectedIndex]
                        .description,
                    maxLines: 10,
                    textColor: APPLICATION_COLOR.SUBTITLE,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ),
              Gap(context.veryLargeSpacerOnlyBottom.bottom),
              Gap(context.largeSpacerSize)
            ],
          ),
        );
      }),
    );
  }

  Widget tabletView(
      BuildContext context, ProjectCampanyTemplateViewModel value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: (context.sHeight / 100) * 85,
          child: Observer(
            builder: (context) {
              if (value.templateNine == null) {
                return const SizedBox.shrink();
              }
              return Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: context.sWidth / 2.82,
                      height: (context.sHeight / 100) * 55,
                      child: NormalNetworkImage(
                          source: value.templateNine!
                              .campaigns[value.selectedIndex].mainImage.url),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                        child: Container(
                          width: context.sWidth / 2.82,
                          height: (context.sHeight / 100) * 55,
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
                                  text: value.templateNine!
                                      .campaigns[value.selectedIndex].title,
                                  maxLines: 1,
                                  fontSize: FONT_SIZE.DISPLAY_MEDIUM,
                                ),
                                Gap(context.largeSpacerSize),
                                LabelText(
                                  text: value
                                      .templateNine!
                                      .campaigns[value.selectedIndex]
                                      .description,
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
                      Gap(context.veryLargeSpacerOnlyBottom.bottom),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ClipRRect(
                            borderRadius: context.midRadius,
                            child: SizedBox(
                              width: context.sWidth / 2.82,
                              child: AspectRatio(
                                aspectRatio: 1.333,
                                child: NormalNetworkImage(
                                    fit: BoxFit.contain,
                                    source: value
                                        .templateNine!
                                        .campaigns[value.selectedIndex]
                                        .mainImage
                                        .url),
                              ),
                            ),
                          ),
                          Gap(context.largeSpacerSize),
                          Observer(
                            builder: (context) {
                              if (value.templateNine == null) {
                                return const SizedBox.shrink();
                              }
                              return SizedBox(
                                width: context.sWidth / 2.82,
                                height: 150,
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount:
                                      value.templateNine!.campaigns.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () =>
                                              value.changeSelectedIndex(index),
                                          child: Container(
                                            height: 150,
                                            width: 199.95,
                                            decoration: BoxDecoration(
                                                border: value.selectedIndex ==
                                                        index
                                                    ? Border.all(
                                                        color: context.toColor(
                                                            APPLICATION_COLOR
                                                                .GOLD))
                                                    : null),
                                            child: NormalNetworkImage(
                                                fit: BoxFit.contain,
                                                source: value
                                                    .templateNine!
                                                    .campaigns[index]
                                                    .mainImage
                                                    .url),
                                          ),
                                        ),
                                        Gap(context.largeSpacerSize)
                                      ],
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          Gap(context.xlargeSpacerSize),
                        ],
                      ),
                      Gap(context.veryLargeSpacerSize)
                    ],
                  ),
                ],
              );
            },
          ),
        ),
        Gap(context.veryLargeSpacerOnlyBottom.bottom)
      ],
    );
  }
}
