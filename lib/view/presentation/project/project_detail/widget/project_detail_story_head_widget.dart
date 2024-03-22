import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class ProjectDetailStoryHeadWidget extends StatelessWidget {
  const ProjectDetailStoryHeadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          GestureDetector(
            onTap: () => null,
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(33),
                  color: Colors.white,
                  border: Border.all(
                      color: context.toColor(APPLICATION_COLOR.GOLD))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(33),
                child: const NormalNetworkImage(
                    source: "https://wallpapercave.com/wp/wp2752752.jpg"),
              ),
            ),
          ),
          Gap(context.midSpacerSize),
          const LabelText(
            text: "Gold Care",
            fontSize: FONT_SIZE.LABEL_SMALL,
          )
        ],
      ),
    );
  }
}
