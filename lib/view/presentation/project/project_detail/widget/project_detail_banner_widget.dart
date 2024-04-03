import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class ProjectDetailBannerWidget extends StatelessWidget {
  final String title;
  final String slogan;
  const ProjectDetailBannerWidget(
      {super.key, required this.title, required this.slogan});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: context.sWidth,
          child: const NormalNetworkImage(
            source:
                "https://iis-akakce.akamaized.net/p.z?%2F%2Fn11scdn%2Eakamaized%2Enet%2Fa1%2F1024%2F14%2F37%2F39%2F15%2FIMG%2D3371096655291613202%2Ejpg",
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
                text: title,
                textColor: APPLICATION_COLOR.GOLD,
                fontSize: FONT_SIZE.HEADLINE_LARGE,
              ),
              Gap(context.smallSpacerSize),
              LabelText(
                text: slogan,
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
