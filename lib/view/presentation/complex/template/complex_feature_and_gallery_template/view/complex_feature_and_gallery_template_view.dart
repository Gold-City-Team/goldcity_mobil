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
import 'package:goldcity/view/presentation/complex/template/complex_feature_and_gallery_template/view_model/complex_feature_and_gallery_template_view_model.dart';
import 'package:goldcity/view/widget/features/features_widget.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class ComplexFeatureAndGalleryTemplateView extends StatelessWidget {
  final int detailId;
  final int settingsId;
  const ComplexFeatureAndGalleryTemplateView(
      {required this.detailId, required this.settingsId, super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ComplexFeatureAndGalleryTemplateViewModel>(
      viewModel: ComplexFeatureAndGalleryTemplateViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.detailId = detailId;
        model.settingsId = settingsId;
        model.init();
      },
      onPageBuilder: (BuildContext context,
              ComplexFeatureAndGalleryTemplateViewModel value) =>
          Scaffold(
        body:
            isTablet() ? tabletView(context, value) : phoneView(context, value),
      ),
    );
  }

  Widget phoneView(
      BuildContext context, ComplexFeatureAndGalleryTemplateViewModel value) {
    return SingleChildScrollView(
      child: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                      .map((e) => ConstrainedBox(
                          constraints:
                              BoxConstraints(maxWidth: context.sWidth / 2 - 10),
                          child: FeaturesWidget(featuresEntity: e)))
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
                          (e) => MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
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
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Container(
                                          color: context
                                              .toColor(APPLICATION_COLOR.DARK),
                                          child: NormalNetworkImage(
                                            fit: BoxFit.cover,
                                            source: e.media.mediaType ==
                                                    MEDIA_TYPE.IMAGE
                                                ? e.media.url
                                                : e.media.mediaMetaData
                                                    .thumbnail,
                                          ),
                                        ),
                                      ).animate().fade(),
                                    ),
                                    e.media.mediaType == MEDIA_TYPE.VIDEO
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
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            ),
            Gap(context.veryLargeSpacerOnlyBottom.bottom)
          ],
        ),
      ),
    );
  }

  Widget tabletView(
      BuildContext context, ComplexFeatureAndGalleryTemplateViewModel value) {
    return SafeArea(
      child: Padding(
        padding: context.largeSpacerOnlyHorizontal,
        child: Row(
          children: [
            Flexible(
              flex: 60,
              child: Observer(builder: (context) {
                if (value.templateEntity == null) {
                  return const SizedBox.shrink();
                }
                return ListView.builder(
                    itemCount: value.templateEntity!.features.length,
                    shrinkWrap: false,
                    padding: context.largeSpacerOnlyTop,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FeaturesWidget(
                              featuresEntity:
                                  value.templateEntity!.features[index]),
                          value.templateEntity!.features.length - 1 == index
                              ? Gap(context.veryLargeSpacerOnlyBottom.bottom)
                              : const SizedBox.shrink()
                        ],
                      );
                    });
              }),
            ),
            Flexible(
                flex: 40,
                child: Observer(builder: (context) {
                  if (value.templateEntity == null) {
                    return const SizedBox.shrink();
                  }
                  return ListView.builder(
                      itemCount: value.templateEntity!.gallery.length,
                      itemBuilder: ((context, index) {
                        return Column(
                          children: [
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () => value.navigateGallery(index),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Container(
                                        width: (context.sWidth / 100) * 40,
                                        height: ((context.sWidth / 100) * 40) /
                                            1.7777,
                                        color: context
                                            .toColor(APPLICATION_COLOR.DARK),
                                        child: NormalNetworkImage(
                                          fit: BoxFit.cover,
                                          source: value
                                                      .templateEntity!
                                                      .gallery[index]
                                                      .media
                                                      .mediaType ==
                                                  MEDIA_TYPE.IMAGE
                                              ? value.templateEntity!
                                                  .gallery[index].media.url
                                              : value
                                                  .templateEntity!
                                                  .gallery[index]
                                                  .media
                                                  .mediaMetaData
                                                  .thumbnail,
                                        ),
                                      ),
                                    ).animate().fade(),
                                    value.templateEntity!.gallery[index].media
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
                            value.templateEntity!.gallery.length - 1 == index
                                ? const SizedBox.shrink()
                                : Gap(context.midSpacerSize),
                            value.templateEntity!.gallery.length - 1 == index
                                ? Gap(context.veryLargeSpacerOnlyBottom.bottom)
                                : const SizedBox.shrink()
                          ],
                        );
                      }));
                }))
          ],
        ),
      ),
    );
  }
}
