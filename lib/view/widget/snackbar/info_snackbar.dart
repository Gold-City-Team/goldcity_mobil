import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class InfoSnackBar extends StatelessWidget {
  final String message;
  const InfoSnackBar({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.sWidth,
      padding: context.midSpacer,
      decoration: BoxDecoration(
        color: context.toColor(APPLICATION_COLOR.LIGHT),
        borderRadius: context.midRadius,
      ),
      child: Row(
        children: [
          Icon(Icons.info, color: context.toColor(APPLICATION_COLOR.BLUE)),
          Gap(context.midSpacerSize),
          Expanded(
            child: LabelText(
                text: message,
                fontSize: FONT_SIZE.LABEL_MEDIUM,
                textColor: APPLICATION_COLOR.BLUE),
          ),
        ],
      ),
    );
  }
}
