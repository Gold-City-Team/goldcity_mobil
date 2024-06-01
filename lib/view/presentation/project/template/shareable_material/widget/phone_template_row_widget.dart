import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class PhoneTemplateRowWidget extends StatelessWidget {
  final String categoryName;
  final int categoryItemCount;
  const PhoneTemplateRowWidget(
      {required this.categoryName, required this.categoryItemCount, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.largeSpacer,
      margin: context.midSpacerOnlyHorizontal,
      decoration: BoxDecoration(
        color: context.toColor(APPLICATION_COLOR.EXTRA_CLOSE_BACKGROUND_COLOR),
        borderRadius: context.midRadius,
      ),
      child: Row(
        children: [
          Expanded(child: LabelText(text: categoryName)),
          const Spacer(),
          CircleAvatar(
              maxRadius: 14,
              child: LabelText(
                text: "$categoryItemCount",
                textColor: APPLICATION_COLOR.BACKGROUND_COLOR,
                fontSize: FONT_SIZE.LABEL_SMALL,
              )),
          Gap(context.smallSpacerSize),
          const Icon(Icons.link)
        ],
      ),
    );
  }
}
