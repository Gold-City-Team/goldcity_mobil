import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/domain/entity/project/project_features/project_features_entity.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class FeaturesWidget extends StatelessWidget {
  final ProjectFeaturesEntity featuresEntity;
  const FeaturesWidget({super.key, required this.featuresEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.midSpacer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(
              height: 50,
              width: 50,
              child: SvgPicture.network(featuresEntity.media.url),
            ),
            Gap(context.midSpacerSize),
            LabelText(
              text: featuresEntity.value,
              textColor: APPLICATION_COLOR.GOLD,
              fontSize: FONT_SIZE.HEADLINE_MEDIUM,
            )
          ]),
          LabelText(text: featuresEntity.title)
        ],
      ),
    );
  }
}
