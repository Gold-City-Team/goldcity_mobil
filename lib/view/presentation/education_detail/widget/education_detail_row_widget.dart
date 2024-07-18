import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/domain/entity/gallery_media/gallery_media_entity.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class EducationDetailRowWidget extends StatelessWidget {
  final GalleryMediaEntity entity;
  const EducationDetailRowWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: context.toColor(APPLICATION_COLOR.EXTRA_CLOSE_BACKGROUND_COLOR),
        width: context.sWidth / 4.5,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.7777,
              child: NormalNetworkImage(
                source: entity.media.mediaMetaData.thumbnail,
              ),
            ),
            Gap(context.midSpacerSize),
            LabelText(
              text: entity.title,
              fontSize: FONT_SIZE.HEADLINE_SMALL,
              fontWeight: FontWeight.bold,
              textColor: APPLICATION_COLOR.OPPOSITE_COLOR,
            ),
            Gap(context.midSpacerSize),
            LabelText(
              text: entity.description,
              textColor: APPLICATION_COLOR.SUBTITLE,
              fontSize: FONT_SIZE.LABEL_MEDIUM,
            ),
            Gap(context.midSpacerSize),
          ],
        ));
  }
}
