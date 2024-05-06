import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/domain/entity/project/project/project_entity.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class ProjectDetailBannerWidget extends StatelessWidget {
  final ProjectEntity projectEntity;
  const ProjectDetailBannerWidget({super.key, required this.projectEntity});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: context.sWidth,
          child: NormalNetworkImage(
            source: projectEntity.detail.media.url,
          ),
        ),
        Container(
          height: context.sWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
                  Colors.transparent,
                ],
                begin: const FractionalOffset(0.0, 1.0),
                end: const FractionalOffset(0.0, 0.0),
                tileMode: TileMode.clamp),
          ),
        ),
        Positioned(
          bottom: 0,
          left: context.midSpacerSize,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabelText(
                text: projectEntity.detail.title,
                textColor: APPLICATION_COLOR.GOLD,
                fontSize: FONT_SIZE.HEADLINE_LARGE,
              ),
              Gap(context.smallSpacerSize),
              LabelText(
                text: projectEntity.detail.slogan,
                textColor: APPLICATION_COLOR.SUBTITLE,
                fontSize: FONT_SIZE.BODY_LARGE,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
