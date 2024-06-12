import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class ComplexMainImageAndTextTemplate extends StatelessWidget {
  const ComplexMainImageAndTextTemplate({super.key});

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
                color: context
                    .toColor(APPLICATION_COLOR.BACKGROUND_COLOR)
                    .withAlpha(200),
                width: context.sWidth / 2,
                height: context.sHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const LabelText(
                      text: "GoldCity",
                      fontSize: FONT_SIZE.DISPLAY_LARGE,
                    )
                        .animate()
                        .fade(duration: const Duration(milliseconds: 1000))
                        .slideX(
                            begin: 1,
                            curve: Curves.easeIn,
                            duration: const Duration(milliseconds: 1000)),
                    Gap(context.midSpacerSize),
                    Padding(
                      padding: context.xlargeSpacerOnlyHorizontal,
                      child: const LabelText(
                        text:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vel quam rutrum, pharetra neque nec, scelerisque mauris.",
                        fontSize: FONT_SIZE.TITLE_LARGE,
                        textColor: APPLICATION_COLOR.SUBTITLE,
                      )
                          .animate()
                          .fade(duration: const Duration(milliseconds: 800))
                          .slideX(
                              begin: -1,
                              duration: const Duration(milliseconds: 800)),
                    ),
                  ],
                ),
              ).animate().fade(duration: const Duration(milliseconds: 500))
            ],
          ),
        ],
      ),
    );
  }
}
