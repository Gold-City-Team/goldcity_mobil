import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/config/language/locale_keys.g.dart';
import 'package:goldcity/data/dto/receive/gallery_media/gallery_media_dto.dart';
import 'package:goldcity/data/dto/receive/media/media_dto.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/presentation/project/template/plan_template/view_model/plan_template_view_model.dart';
import 'package:goldcity/view/presentation/project/template/plan_template/widget/row_widget.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class PlanTemplateView extends StatelessWidget {
  const PlanTemplateView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PlanTemplateViewModel>(
      viewModel: PlanTemplateViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, PlanTemplateViewModel value) =>
          Scaffold(
        body:
            isTablet() ? tabletView(context, value) : phoneView(context, value),
      ),
    );
  }

  Widget tabletView(BuildContext context, PlanTemplateViewModel value) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(context.midSpacerSize),
            SizedBox(
              height: ((context.sWidth / 3) - 20) / 1.7777,
              child: ListView.builder(
                itemCount: value.photoList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () => value.navigateToGallery(
                      [
                        GalleryMediaDto(
                          id: 1,
                          mediaItem: MediaDto(
                              id: 1,
                              mediaType: MEDIA_TYPE.IMAGE,
                              url:
                                  "https://gold-city-2.fra1.digitaloceanspaces.com/IMAGE/be27b610-1f4e-4a82-8be0-d35659e3e0a0.webp"),
                        ).toEntity(),
                        GalleryMediaDto(
                          id: 2,
                          mediaItem: MediaDto(
                              id: 2,
                              mediaType: MEDIA_TYPE.IMAGE,
                              url:
                                  "https://gold-city-2.fra1.digitaloceanspaces.com/IMAGE/f71f46fb-7f04-42c7-a866-26ec7f632954.webp"),
                        ).toEntity(),
                      ],
                    ),
                    child: Container(
                      margin: context.midSpacerOnlyHorizontal,
                      width: (context.sWidth / 3) - 20,
                      height: ((context.sWidth / 3) - 20) / 1.7777,
                      child: Container(
                        color: context.toColor(APPLICATION_COLOR.DARK),
                        child: NormalNetworkImage(
                            fit: BoxFit.cover, source: value.photoList[index]),
                      ).animate().fade(),
                    ),
                  );
                }),
              ),
            ),
            Gap(context.largeSpacerSize),
            Gap(context.midSpacerSize),
            Padding(
              padding: context.midSpacerOnlyHorizontal,
              child: Observer(builder: (context) {
                if (value.fullViewItemIndex.isEmpty) {}
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.getBlok().length,
                    itemBuilder: (context, index) {
                      final blok = value.getBlok()[index];
                      final floorList = value.getFloorListWithBlok(blok);
                      final homesByBlok = value.template.homes
                          .where((home) => home.blok == blok)
                          .toList();

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LabelText(
                            text: LocaleKeys.block.tr(args: [blok]),
                            fontSize: FONT_SIZE.HEADLINE_LARGE,
                          ),
                          Gap(context.midSpacerSize),
                          Column(
                            children: floorList.map((floor) {
                              final homesByFloor = homesByBlok
                                  .where((home) => home.floor == floor)
                                  .toList();

                              return Container(
                                margin: context.midSpacerOnlyBottom,
                                child: GestureDetector(
                                  onTap: () => value.toggleFullViewItemIndex(
                                      "$floor${value.template.homes[index].id}"),
                                  child: RowWidget(
                                      home: homesByFloor,
                                      isFullView: value.fullViewItemIndex.any(
                                          (element) =>
                                              element ==
                                              "$floor${value.template.homes[index].id}")),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      );
                    });
              }),
            ),
            Gap(context.veryLargeSpacerOnlyBottom.bottom)
          ],
        ),
      ),
    );
  }

  Widget phoneView(BuildContext context, PlanTemplateViewModel value) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(context.midSpacerSize),
            SizedBox(
              height: ((context.sWidth / 1.10) - 20) / 1.7777,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () => value.navigateToGallery([
                      GalleryMediaDto(
                        id: 1,
                        mediaItem: MediaDto(
                            id: 1,
                            mediaType: MEDIA_TYPE.IMAGE,
                            url:
                                "https://gold-city-2.fra1.digitaloceanspaces.com/IMAGE/be27b610-1f4e-4a82-8be0-d35659e3e0a0.webp"),
                      ).toEntity(),
                      GalleryMediaDto(
                        id: 2,
                        mediaItem: MediaDto(
                            id: 2,
                            mediaType: MEDIA_TYPE.IMAGE,
                            url:
                                "https://gold-city-2.fra1.digitaloceanspaces.com/IMAGE/f71f46fb-7f04-42c7-a866-26ec7f632954.webp"),
                      ).toEntity(),
                    ]),
                    child: Container(
                      margin: context.midSpacerOnlyHorizontal,
                      width: (context.sWidth / 1.10) - 20,
                      height: ((context.sWidth / 1.10) - 20) / 1.7777,
                      child: Container(
                        color: context.toColor(APPLICATION_COLOR.DARK),
                        child: NormalNetworkImage(
                            fit: BoxFit.cover, source: value.photoList[index]),
                      ).animate().fade(),
                    ),
                  );
                }),
              ),
            ),
            Gap(context.largeSpacerSize),
            Padding(
              padding: context.midSpacerOnlyHorizontal,
              child: Observer(builder: (context) {
                if (value.fullViewItemIndex.isEmpty) {}
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: context.sHeight,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: value.getBlok().length,
                        itemBuilder: (context, index) {
                          final blok = value.getBlok()[index];
                          final floorList = value.getFloorListWithBlok(blok);
                          final homesByBlok = value.template.homes
                              .where((home) => home.blok == blok)
                              .toList();

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LabelText(
                                text: LocaleKeys.block.tr(args: [blok]),
                                fontSize: FONT_SIZE.HEADLINE_LARGE,
                              ),
                              Gap(context.midSpacerSize),
                              Column(
                                children: floorList.map((floor) {
                                  final homesByFloor = homesByBlok
                                      .where((home) => home.floor == floor)
                                      .toList();

                                  return Container(
                                    margin: context.midSpacerOnlyBottom,
                                    child: GestureDetector(
                                      onTap: () => value.toggleFullViewItemIndex(
                                          "$floor${value.template.homes[index].id}"),
                                      child: RowWidget(
                                          home: homesByFloor,
                                          isFullView: value.fullViewItemIndex
                                              .any((element) =>
                                                  element ==
                                                  "$floor${value.template.homes[index].id}")),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          );
                        }),
                  ),
                );
              }),
            ),
            Gap(context.veryLargeSpacerOnlyBottom.bottom)
          ],
        ),
      ),
    );
  }
}
