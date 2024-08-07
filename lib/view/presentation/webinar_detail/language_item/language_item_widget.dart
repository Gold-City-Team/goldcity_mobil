import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/domain/entity/project/language/project_language_entity.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class LanguageItemWidget extends StatelessWidget {
  final LanguageDetailEntity value;
  const LanguageItemWidget({required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color:
              context.toColor(APPLICATION_COLOR.EXTRA_CLOSE_BACKGROUND_COLOR),
          borderRadius: BorderRadius.all(
              isTablet() ? Radius.circular(75) : Radius.circular(50))),
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: context
                            .toColor(APPLICATION_COLOR.DARK)
                            .withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 7)),
                  ],
                  color: context
                      .toColor(APPLICATION_COLOR.EXTRA_CLOSE_BACKGROUND_COLOR),
                  borderRadius: BorderRadius.all(
                      isTablet() ? Radius.circular(75) : Radius.circular(50))),
              height: isTablet() ? 150 : 100,
              child: NormalNetworkImage(source: value.mediaItem.url)),
          Gap(context.veryLargeSpacerSize),
          LabelText(
            text: value.name,
            textColor: APPLICATION_COLOR.OPPOSITE_COLOR,
            fontSize: isTablet()
                ? FONT_SIZE.HEADLINE_MEDIUM
                : FONT_SIZE.HEADLINE_SMALL,
          ),
        ],
      ),
    );
  }
}
