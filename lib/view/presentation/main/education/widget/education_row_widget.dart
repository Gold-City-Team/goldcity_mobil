import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/domain/entity/education/education/education_entity.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class EducationRowWidget extends StatelessWidget {
  final EducationEntity entity;
  const EducationRowWidget({required this.entity, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.midSpacer,
      decoration: BoxDecoration(
        color: context.toColor(APPLICATION_COLOR.EXTRA_CLOSE_BACKGROUND_COLOR),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
              aspectRatio: 1.7777,
              child: NormalNetworkImage(
                  source: entity.detailEntity.mainImage.url)),
          Gap(context.midSpacerSize),
          LabelText(
              maxLines: 2,
              text: entity.detailEntity.title,
              textColor: APPLICATION_COLOR.LIGHT,
              fontSize: FONT_SIZE.HEADLINE_MEDIUM),
          Gap(context.midSpacerSize),
          LabelText(
              text: entity.detailEntity.description,
              maxLines: 3,
              textColor: APPLICATION_COLOR.SUBTITLE,
              fontSize: FONT_SIZE.BODY_LARGE),
        ],
      ),
    );
  }
}
