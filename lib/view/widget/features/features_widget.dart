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
  double width = 0;
  FeaturesWidget({super.key, this.width = 0, required this.featuresEntity});

  @override
  Widget build(BuildContext context) {
    width = width == 0
        ? isTablet()
            ? 300
            : 100
        : width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: Center(
                child: SizedBox(
                  height: isTablet() ? 40 : 30,
                  width: isTablet() ? 40 : 30,
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
              ),
            ),
            Gap(context.midSpacerSize),
            Container(
              height: 50,
              width: width - 60,
              alignment: Alignment.centerLeft,
              child: LabelText(
                textLineHeight: 1.2,
                text: featuresEntity.value,
                maxLines: 2,
                textColor: APPLICATION_COLOR.TITLE,
                fontSize:
                    isTablet() ? FONT_SIZE.TITLE_LARGE : FONT_SIZE.BODY_LARGE,
              ),
            ),
          ],
        ).animate().fade(duration: const Duration(milliseconds: 750)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 60),
            featuresEntity.title.isEmpty
                ? const SizedBox.shrink()
                : SizedBox(
                    width: width - 60,
                    child: LabelText(
                      text: featuresEntity.title,
                      textColor: APPLICATION_COLOR.SUBTITLE,
                      fontSize: FONT_SIZE.LABEL_LARGE,
                    ),
                  )
          ],
        )
      ],
    );
  }
}
