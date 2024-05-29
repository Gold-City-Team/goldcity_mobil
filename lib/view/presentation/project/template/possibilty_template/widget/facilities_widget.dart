import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/domain/entity/possibility/possibility_entity.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class FacilitiesWidget extends StatelessWidget {
  final PossibilityEntity possibilityEntity;
  const FacilitiesWidget({required this.possibilityEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: context.largeRadius,
        border: Border.all(color: context.toColor(APPLICATION_COLOR.GOLD)),
        color: context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
      ),
      margin: context.midSpacerOnlyHorizontal,
      child: Padding(
        padding: context.midSpacerOnlyHorizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: context.midRadius,
              child: SizedBox(
                height: 72,
                width: 72,
                child: NormalNetworkImage(source: possibilityEntity.media.url),
              ),
            ),
            Gap(context.midSpacerSize),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelText(
                    text: possibilityEntity.title,
                    fontSize: FONT_SIZE.TITLE_LARGE,
                    textColor: APPLICATION_COLOR.TITLE,
                  ),
                  LabelText(
                    text: possibilityEntity.description,
                    fontSize: FONT_SIZE.TITLE_SMALL,
                    textColor: APPLICATION_COLOR.SUBTITLE,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
