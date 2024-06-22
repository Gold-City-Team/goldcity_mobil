import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class ProjectListWidget extends StatelessWidget {
  const ProjectListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.largeSpacerOnlyHorizontal,
      width: context.sWidth,
      height: context.sHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(context.veryLargeSpacerSize),
          const LabelText(
            text: "Projeler",
            fontSize: FONT_SIZE.DISPLAY_LARGE,
            textLineHeight: 1,
          )
        ],
      ),
    );
  }
}
