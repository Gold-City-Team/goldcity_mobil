import 'package:flutter/material.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class NormalButton extends StatelessWidget {
  final APPLICATION_COLOR backgroundColor;
  final APPLICATION_COLOR textColor;
  final String text;
  final VoidCallback onTap;
  const NormalButton({
    super.key,
    this.backgroundColor = APPLICATION_COLOR.CLOSE_BACKGROUND_COLOR,
    this.textColor = APPLICATION_COLOR.BACKGROUND_COLOR,
    this.text = "",
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.sWidth,
      child: TextButton(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
          backgroundColor: WidgetStatePropertyAll(
            context.toColor(backgroundColor),
          ),
        ),
        onPressed: () => onTap(),
        child: LabelText(
          textColor: textColor,
          text: text,
        ),
      ),
    );
  }
}
