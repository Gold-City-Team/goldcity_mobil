import 'package:flutter/material.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  const ButtonWidget({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.sWidth / 2 - 20,
      margin: context.midSpacer,
      decoration: BoxDecoration(
        color: context.toColor(APPLICATION_COLOR.EXTRA_CLOSE_BACKGROUND_COLOR),
        boxShadow: const [BoxShadow(color: Colors.black)],
      ),
      width: context.sWidth / 2 - 20,
      child: Center(
          child: Padding(
        padding: context.midSpacer,
        child: LabelText(
          text: text,
          fontSize: FONT_SIZE.HEADLINE_LARGE,
        ),
      )),
    );
  }
}
