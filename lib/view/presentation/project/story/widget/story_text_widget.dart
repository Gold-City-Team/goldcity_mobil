import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/text/golden_label_text.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class StoryTextWidget extends StatelessWidget {
  const StoryTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: context.sWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
                  Colors.transparent,
                ],
                begin: const FractionalOffset(0.0, 1.0),
                end: const FractionalOffset(0.0, 0.0),
                tileMode: TileMode.clamp),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: context.smallSpacerOnlyHorizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const GoldLabelText(
                    firstText: "Gold",
                    secondText: "City",
                    fontSize: FONT_SIZE.DISPLAY_MEDIUM),
                Gap(context.midSpacerSize),
                const LabelText(
                    text:
                        "Doğadan kopmadan,  teknolojinin rahatlığını bırakmadan yaşa",
                    fontSize: FONT_SIZE.TITLE_MEDIUM),
                Gap(context.veryLargeSpacerSize),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
