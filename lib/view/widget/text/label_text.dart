import 'package:flutter/material.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/theme_extension.dart';

class LabelText extends StatelessWidget {
  final String text;
  final double? textLineHeight;
  final TextOverflow overflow;
  final FONT_SIZE fontSize;
  final APPLICATION_COLOR textColor;
  final TextAlign align;
  final int? maxLines;
  final FontWeight? fontWeight;
  const LabelText(
      {super.key,
      required this.text,
      this.fontSize = FONT_SIZE.BODY_LARGE,
      this.textColor = APPLICATION_COLOR.TITLE,
      this.overflow = TextOverflow.visible,
      this.align = TextAlign.left,
      this.textLineHeight,
      this.fontWeight,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: overflow,
      textAlign: align,
      style: context.toTextStyle(fontSize).copyWith(
            color: context.toColor(textColor),
            fontWeight: fontWeight,
            height: textLineHeight,
          ),
      text,
      maxLines: maxLines,
    );
  }
}
