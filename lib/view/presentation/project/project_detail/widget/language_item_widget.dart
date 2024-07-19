import 'package:flutter/material.dart';
import 'package:goldcity/domain/entity/project/project_language/project_language_entity.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class LanguageItemWidget extends StatelessWidget {
  final ProjectLanguageDetailEntity value;
  const LanguageItemWidget({required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.largeSpacerOnlyHorizontal,
      alignment: Alignment.center,
      margin: context.midSpacer,
      color: context.toColor(APPLICATION_COLOR.EXTRA_CLOSE_BACKGROUND_COLOR),
      child: LabelText(
        text: value.name,
        textColor: APPLICATION_COLOR.OPPOSITE_COLOR,
        fontSize: FONT_SIZE.HEADLINE_MEDIUM,
      ),
    );
  }
}
