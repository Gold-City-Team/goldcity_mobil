// ignore_for_file: deprecated_member_use

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
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: isTablet() ? 35 : 25,
            width: isTablet() ? 35 : 25,
            child: SvgPicture.network(
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
                  text: featuresEntity.value,
                  textColor: APPLICATION_COLOR.GOLD,
                  fontSize:
                      isTablet() ? FONT_SIZE.BODY_LARGE : FONT_SIZE.BODY_LARGE,
                ),
                LabelText(
                  text: featuresEntity.title,
                  fontSize: isTablet()
                      ? FONT_SIZE.LABEL_LARGE
                      : FONT_SIZE.LABEL_LARGE,
                )
              ],
            ),
          )
        ],
      ).animate().fade().slide(
          begin: const Offset(0.5, 0),
          end: const Offset(0, 0),
          curve: Curves.easeIn),
    );
  }
}
