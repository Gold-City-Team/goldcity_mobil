import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/language/locale_keys.g.dart';
import 'package:goldcity/domain/entity/project/project/project_entity.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/button/normal_button.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class ProjectRowPhoneWidget extends StatelessWidget {
  final VoidCallback onTap;
  final ProjectEntity projectEntity;
  const ProjectRowPhoneWidget(
      {required this.projectEntity, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.midSpacer,
      decoration: BoxDecoration(
        color: context.toColor(APPLICATION_COLOR.EXTRA_CLOSE_BACKGROUND_COLOR),
        borderRadius: context.midRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: context.sWidth,
            height: context.sWidth / 1.777,
            child: FlutterCarousel(
              options: CarouselOptions(
                  showIndicator: true,
                  slideIndicator: const CircularSlideIndicator(),
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  padEnds: false,
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  pageSnapping: true),
              items: [1, 1].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: context.midRadius,
                      child: const NormalNetworkImage(
                          source:
                              "https://goldcitycondominium.com/images/projects/golfAqua/ic/ic1.webp"),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Gap(context.midSpacerSize),
          LabelText(
              text: projectEntity.detail.title,
              textColor: APPLICATION_COLOR.TITLE,
              fontSize: FONT_SIZE.HEADLINE_LARGE),
          LabelText(
              text: projectEntity.detail.slogan,
              textColor: APPLICATION_COLOR.SUBTITLE,
              fontSize: FONT_SIZE.BODY_LARGE),
          Gap(context.midSpacerSize),
          NormalButton(
            onTap: () => onTap(),
            text: LocaleKeys.explore.tr(),
            textColor: APPLICATION_COLOR.LIGHT,
            backgroundColor: APPLICATION_COLOR.GOLD,
          )
        ],
      ),
    );
  }
}
