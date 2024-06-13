import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class ComplexGalleryAndInfoTemplate extends StatelessWidget {
  const ComplexGalleryAndInfoTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isTablet() ? tabletView(context) : phoneView(context),
    );
  }

  Widget tabletView(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: context.sWidth,
          height: context.sHeight,
          child: const NormalNetworkImage(
            source:
                "https://wallpapers.com/images/hd/4k-architecture-yellow-glass-building-6d7nbmyltxlyxxv8.jpg",
            fit: BoxFit.cover,
          ),
        ),
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
              SizedBox(
                width: context.sWidth / 2.1,
                child: const LabelText(
                  text: "GoldCity",
                  fontSize: FONT_SIZE.DISPLAY_LARGE,
                )
                    .animate()
                    .fade(duration: const Duration(milliseconds: 1100))
                    .slideX(
                        begin: 1,
                        curve: Curves.easeIn,
                        duration: const Duration(milliseconds: 1100)),
              ),
              Gap(context.largeSpacerSize),
              SizedBox(
                width: context.sWidth / 2.1,
                child: const LabelText(
                  text:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vel quam rutrum, pharetra neque nec, scelerisque mauris.",
                  fontSize: FONT_SIZE.TITLE_LARGE,
                  textColor: APPLICATION_COLOR.SUBTITLE,
                )
                    .animate()
                    .fade(duration: const Duration(milliseconds: 1100))
                    .slideX(
                        begin: -1,
                        duration: const Duration(milliseconds: 1100)),
              ),
              Gap(context.veryLargeSpacerSize),
              Container(
                  height: 175,
                  margin: context.largeSpacerOnlyRight,
                  width: context.sWidth,
                  child: Row(children: [
                    const LabelText(
                      text: "Galeri",
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
                            ListView.builder(
                                itemCount: 10,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: index != 9
                                        ? context.midSpacerOnlyRight
                                        : EdgeInsets.zero,
                                    width: 175 * 1.777,
                                    height: 175,
                                    child: ClipRRect(
                                      borderRadius: context.midRadius,
                                      child: const NormalNetworkImage(
                                        fit: BoxFit.cover,
                                        source:
                                            "https://wallpapercave.com/wp/wp2752752.jpg",
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
                                              milliseconds: 500));
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

  Widget phoneView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            SizedBox(
              width: context.sWidth,
              height: context.sWidth / 1.7777,
              child: const NormalNetworkImage(
                  source: "https://wallpapercave.com/wp/wp2752752.jpg",
                  fit: BoxFit.cover),
            ),
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
        Padding(
          padding: context.largeSpacerOnlyHorizontal,
          child: const LabelText(
            text: "GoldCity",
            fontSize: FONT_SIZE.HEADLINE_LARGE,
          ),
        ).animate().fade(),
        Gap(context.largeSpacerSize),
        Padding(
          padding: context.largeSpacerOnlyHorizontal,
          child: const LabelText(
            text:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vel quam rutrum, pharetra neque nec, scelerisque mauris.",
            fontSize: FONT_SIZE.LABEL_LARGE,
            textColor: APPLICATION_COLOR.SUBTITLE,
          ),
        ).animate().fade(),
        Gap(context.largeSpacerSize),
        Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 0,
            children: [1, 1, 1]
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
                              color: context.toColor(APPLICATION_COLOR.DARK),
                              child: const NormalNetworkImage(
                                fit: BoxFit.cover,
                                source:
                                    "https://wallpapercave.com/wp/wp2752752.jpg",
                              ),
                            ),
                          ).animate().fade(),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        Gap(context.veryLargeSpacerOnlyBottom.bottom)
      ],
    );
  }
}
