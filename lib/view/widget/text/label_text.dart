import 'package:flutter/material.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/theme_extension.dart';

class LabelText extends StatelessWidget {
  final String text;
  final TextOverflow overflow;
  final FONT_SIZE fontSize;
  final APPLICATION_COLOR textColor;
  final int? maxLines;
  const LabelText(
      {super.key,
      required this.text,
      this.fontSize = FONT_SIZE.BODY_LARGE,
      this.textColor = APPLICATION_COLOR.TITLE,
      this.overflow = TextOverflow.visible,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: overflow,
      style: context
          .toTextStyle(fontSize)
          .copyWith(color: context.toColor(textColor)),
      text,
      maxLines: maxLines,
    );
  }
}