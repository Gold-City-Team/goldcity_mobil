import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';

class ProjectDetailStoryHeadWidget extends StatelessWidget {
  const ProjectDetailStoryHeadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => null,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(33),
                color: Colors.white,
                border:
                    Border.all(color: context.toColor(APPLICATION_COLOR.GOLD))),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(33),
              child: const NormalNetworkImage(
                  source: "https://wallpapercave.com/wp/wp2752752.jpg"),
            ),
          ),
        ),
        Gap(context.midSpacerSize)
      ],
    );
  }
}
