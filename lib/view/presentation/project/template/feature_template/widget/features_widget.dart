import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/domain/entity/project/project_features/project_features_entity.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class FeaturesWidget extends StatelessWidget {
  final ProjectFeaturesEntity featuresEntity;
  const FeaturesWidget({super.key, required this.featuresEntity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Padding(
        padding: context.midSpacer,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: SvgPicture.network(
                featuresEntity.media.url,
                color: context.toColor(APPLICATION_COLOR.GOLD),
              ),
            ),
            Gap(context.midSpacerSize),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelText(
                    text: featuresEntity.value,
                    textColor: APPLICATION_COLOR.GOLD,
                    fontSize: FONT_SIZE.HEADLINE_MEDIUM,
                  ),
                  LabelText(text: featuresEntity.title)
                ],
              ),
            )
          ],
        ),
      ),
    ).animate().fade().slide(
        begin: const Offset(0.5, 0),
        end: const Offset(0, 0),
        curve: Curves.easeIn);
  }
}
