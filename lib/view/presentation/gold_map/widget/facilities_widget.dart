import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class FacilitiesWidget extends StatelessWidget {
  const FacilitiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: context.largeRadius,
        border: Border.all(color: context.toColor(APPLICATION_COLOR.GOLD)),
        color: context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
      ),
      margin: context.midSpacerOnlyHorizontal,
      child: Padding(
        padding: context.midSpacerOnlyHorizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 72,
              width: 72,
              child: NormalNetworkImage(
                  source: "https://wallpapercave.com/wp/wp2752752.jpg"),
            ),
            Gap(context.midSpacerSize),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelText(
                  text: "Gold City",
                  fontSize: FONT_SIZE.TITLE_MEDIUM,
                  textColor: APPLICATION_COLOR.TITLE,
                ),
                LabelText(
                  text: "Lorem ipsum dolor sit amet.",
                  fontSize: FONT_SIZE.TITLE_SMALL,
                  textColor: APPLICATION_COLOR.SUBTITLE,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
