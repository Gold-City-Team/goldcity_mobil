import 'package:flutter/material.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class GoldLabelText extends StatelessWidget {
  final String firstText;
  final String secondText;

  final FONT_SIZE fontSize;

  const GoldLabelText({
    super.key,
    required this.firstText,
    required this.secondText,
    this.fontSize = FONT_SIZE.BODY_LARGE,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: context.midSpacerSize,
      children: [
        LabelText(text: firstText, fontSize: fontSize),
        LabelText(
          text: secondText,
          textColor: APPLICATION_COLOR.GOLD,
          fontSize: fontSize,
        ),
      ],
    );
  }
}
