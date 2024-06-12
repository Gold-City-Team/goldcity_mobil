import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class ComplexGalleryAndInfoTemplate extends StatelessWidget {
  const ComplexGalleryAndInfoTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                padding: context.xlargeSpacerOnlyHorizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const LabelText(
                      text: "GoldCity",
                      fontSize: FONT_SIZE.DISPLAY_LARGE,
                    )
                        .animate()
                        .fade(duration: const Duration(milliseconds: 1100))
                        .slideX(
                            begin: 1,
                            curve: Curves.easeIn,
                            duration: const Duration(milliseconds: 1100)),
                    Gap(context.midSpacerSize),
                    const LabelText(
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
                    Gap(context.largeSpacerSize),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 150 * 1.777,
                              height: 150,
                              color: Colors.red,
                              margin: context.midSpacerOnlyRight,
                            );
                          }),
                    )
                  ],
                ),
              ).animate().fade(duration: const Duration(milliseconds: 1100)),
              Container(
                color: context
                    .toColor(APPLICATION_COLOR.BACKGROUND_COLOR)
                    .withAlpha(200),
                width: context.sWidth / 15,
                height: context.sHeight,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
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
        ],
      ),
    );
  }
}
