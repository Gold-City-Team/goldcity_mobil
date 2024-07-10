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
      padding: context.midSpacerOnlyRight,
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 1.777,
                    child: NormalNetworkImage(
                        source: entity.media.mediaMetaData.thumbnail),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: context.toColor(APPLICATION_COLOR.GOLD),
                        borderRadius: context.xLargeRadius),
                    child: Icon(Icons.play_arrow),
                  ),
                ],
              )),
          Gap(context.largeSpacerSize),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelText(
                  text: entity.title,
                  fontSize: FONT_SIZE.HEADLINE_SMALL,
                ),
                Gap(context.midSpacerSize),
                LabelText(
                  text: entity.description,
                  textColor: APPLICATION_COLOR.SUBTITLE,
                ),
              ],
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: context.toColor(APPLICATION_COLOR.GOLD),
                borderRadius: context.xLargeRadius),
            child: Icon(Icons.play_arrow),
          ),
        ],
      ),
    );
  }
}
