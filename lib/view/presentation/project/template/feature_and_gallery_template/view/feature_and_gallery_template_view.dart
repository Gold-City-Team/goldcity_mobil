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
import 'package:goldcity/view/presentation/project/template/feature_and_gallery_template/view_model/feature_and_gallery_template_view_model.dart';
import 'package:goldcity/view/widget/features/features_widget.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class FeatureAndGalleryTemplateView extends StatelessWidget {
  const FeatureAndGalleryTemplateView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<FeatureAndGalleryTemplateViewModel>(
      viewModel: FeatureAndGalleryTemplateViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder:
          (BuildContext context, FeatureAndGalleryTemplateViewModel value) =>
              Scaffold(
        body:
            isTablet() ? tabletView(context, value) : phoneView(context, value),
      ),
    );
  }

  Widget phoneView(
      BuildContext context, FeatureAndGalleryTemplateViewModel value) {
    return SafeArea(
      top: false,
      right: false,
      left: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Observer(builder: (context) {
                  if (value.templateEntity == null) {
                    return const SizedBox.shrink();
                  }
                  return SizedBox(
                    width: context.sWidth,
                    height: context.sWidth / 1.7777,
                    child: NormalNetworkImage(
                        source: value.templateEntity!.mediaItem.url,
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
              if (value.templateEntity == null) {
                return const SizedBox.shrink();
              }
              return Padding(
                padding: context.largeSpacerOnlyHorizontal,
                child: LabelText(
                  text: value.templateEntity!.title,
                  fontSize: FONT_SIZE.HEADLINE_LARGE,
                ),
              ).animate().fade();
            }),
            Gap(context.midSpacerSize),
            Observer(builder: (context) {
              if (value.templateEntity == null) {
                return const SizedBox.shrink();
              }
              return Padding(
                padding: context.midSpacerOnlyHorizontal,
                child: Wrap(
                  children: value.templateEntity!.features
                      .map((e) => FeaturesWidget(featuresEntity: e))
                      .toSet()
                      .toList(),
                ),
              );
            }),
            Gap(context.midSpacerSize),
            Observer(
              builder: (context) {
                if (value.templateEntity == null) {
                  return const SizedBox.shrink();
                }
                return Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    runSpacing: 0,
                    children: value.templateEntity!.gallery
                        .map(
                          (e) => GestureDetector(
                            onTap: () => value.navigateGallery(
                              value.templateEntity!.gallery
                                  .indexWhere((element) => element == e),
                            ),
                            child: Padding(
                              padding: context.midSpacerOnlyBottom,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    width: (context.sWidth / 2) - 20,
                                    height:
                                        ((context.sWidth / 2) - 20) / 1.7777,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Container(
                                        color: context
                                            .toColor(APPLICATION_COLOR.DARK),
                                        child: NormalNetworkImage(
                                          fit: BoxFit.cover,
                                          source: e.mediaItem.mediaType ==
                                                  MEDIA_TYPE.IMAGE
                                              ? e.mediaItem.url
                                              : e.mediaItem.mediaMetaData
                                                  .thumbnail,
                                        ),
                                      ),
                                    ).animate().fade(),
                                  ),
                                  e.mediaItem.mediaType == MEDIA_TYPE.VIDEO
                                      ? Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: context.toColor(
                                                  APPLICATION_COLOR.GOLD),
                                              borderRadius:
                                                  context.largeRadius),
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
            )
          ],
        ),
      ),
    );
  }

  Widget tabletView(
      BuildContext context, FeatureAndGalleryTemplateViewModel value) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: context.sHeight - 350,
              ),
              child: Padding(
                padding: context.largeSpacer,
                child: Row(
                  children: [
                    SizedBox(
                      width: context.sWidth / 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Observer(builder: (context) {
                                if (value.templateEntity == null) {
                                  return const SizedBox.shrink();
                                }
                                return LabelText(
                                  text: value.templateEntity!.title,
                                  fontSize: FONT_SIZE.HEADLINE_LARGE,
                                ).animate().fade();
                              }),
                            ],
                          ),
                          Gap(context.largeSpacerSize),
                          Observer(builder: (context) {
                            if (value.templateEntity == null) {
                              return const SizedBox.shrink();
                            }
                            return Wrap(
                              children: value.templateEntity!.features
                                  .map((e) => FeaturesWidget(featuresEntity: e))
                                  .toSet()
                                  .toList(),
                            );
                          }),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: SizedBox(
                          width: (context.sWidth / 2) - 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Observer(builder: (context) {
                              if (value.templateEntity == null) {
                                return const SizedBox.shrink();
                              }
                              return NormalNetworkImage(
                                  source: value.templateEntity!.mediaItem.url);
                            }),
                          ),
                        ),
                      ),
                    ).animate().fade()
                  ],
                ),
              ),
            ),
            Observer(
              builder: (context) {
                if (value.templateEntity == null) {
                  return const SizedBox.shrink();
                }
                return Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: value.templateEntity!.gallery
                      .map(
                        (e) => SizedBox(
                          width: context.sWidth / 3 - 20,
                          height: (context.sWidth / 3 - 20) / 1.7777,
                          child: GestureDetector(
                            onTap: () => value.navigateGallery(
                              value.templateEntity!.gallery
                                  .indexWhere((element) => element == e),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Container(
                                    width: context.sWidth / 3 - 20,
                                    height: (context.sWidth / 3 - 20) / 1.7777,
                                    color:
                                        context.toColor(APPLICATION_COLOR.DARK),
                                    child: NormalNetworkImage(
                                      fit: BoxFit.cover,
                                      source: e.mediaItem.mediaType ==
                                              MEDIA_TYPE.IMAGE
                                          ? e.mediaItem.url
                                          : e.mediaItem.mediaMetaData.thumbnail,
                                    ),
                                  ),
                                ).animate().fade(),
                                e.mediaItem.mediaType == MEDIA_TYPE.VIDEO
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
                      )
                      .toList(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}