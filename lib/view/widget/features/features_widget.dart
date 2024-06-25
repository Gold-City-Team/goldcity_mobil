// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/domain/entity/features/features_entity.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class FeaturesWidget extends StatelessWidget {
  final FeaturesEntity featuresEntity;
  const FeaturesWidget({super.key, required this.featuresEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.midSpacer,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: isTablet() ? 30 : 25,
            width: isTablet() ? 30 : 25,
            child: kIsWeb
                ? Image.network(
                    featuresEntity.media.url,
                    color: context.toColor(APPLICATION_COLOR.GOLD),
                  )
                : SvgPicture.network(
                    featuresEntity.media.url,
                    color: context.toColor(APPLICATION_COLOR.GOLD),
                  ),
          ),
          Gap(context.midSpacerSize),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelText(
                  textLineHeight: 1,
                  text: featuresEntity.value,
                  textColor: APPLICATION_COLOR.TITLE,
                  fontSize: isTablet()
                      ? FONT_SIZE.HEADLINE_SMALL
                      : FONT_SIZE.BODY_LARGE,
                ),
                Gap(context.midSpacerSize),
                LabelText(
                  text: featuresEntity.title,
                  textColor: APPLICATION_COLOR.SUBTITLE,
                  fontSize:
                      isTablet() ? FONT_SIZE.BODY_LARGE : FONT_SIZE.LABEL_LARGE,
                )
              ],
            ),
          )
        ],
      ).animate().fade(duration: const Duration(milliseconds: 750)),
    );
  }
}
