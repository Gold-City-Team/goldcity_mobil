import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/button/normal_button.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class EducationRowWidget extends StatelessWidget {
  final VoidCallback onTap;
  const EducationRowWidget({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.midSpacer,
      decoration: BoxDecoration(
        color: context.toColor(APPLICATION_COLOR.EXTRA_CLOSE_BACKGROUND_COLOR),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NormalNetworkImage(
              source:
                  "https://goldcitycondominium.com/images/projects/golfAqua/ic/ic1.webp"),
          Gap(context.midSpacerSize),
          const Row(
            children: [
              Spacer(),
              LabelText(
                  text: "01/07/2024",
                  textColor: APPLICATION_COLOR.SUBTITLE,
                  fontSize: FONT_SIZE.BODY_LARGE),
            ],
          ),
          const LabelText(
              maxLines: 2,
              text:
                  "Test Eğitimi sdf asşkldfasd şsdf slş slşşlfsdşl aslş lşsd flşsdöf lşsa",
              textColor: APPLICATION_COLOR.TITLE,
              fontSize: FONT_SIZE.HEADLINE_LARGE),
          Gap(context.midSpacerSize),
          NormalButton(
            onTap: () => onTap(),
            text: "Detay",
          )
        ],
      ),
    );
  }
}
