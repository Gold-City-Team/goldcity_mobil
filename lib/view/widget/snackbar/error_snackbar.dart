import 'package:flutter/material.dart';

import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class ErrorSnackBar extends StatelessWidget {
  final String message;
  const ErrorSnackBar({required this.message, super.key});

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
          Icon(Icons.priority_high,
              color: context.toColor(APPLICATION_COLOR.RED)),
          Expanded(
            child: LabelText(
                text: message,
                fontSize: FONT_SIZE.LABEL_MEDIUM,
                textColor: APPLICATION_COLOR.RED),
          ),
        ],
      ),
    );
  }
}
