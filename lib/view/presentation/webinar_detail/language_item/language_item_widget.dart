import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/domain/entity/project/language/project_language_entity.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class LanguageItemWidget extends StatelessWidget {
  final LanguageDetailEntity value;
  const LanguageItemWidget({required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: context.sHeight / 1.8,
      margin: context.midSpacer,
      decoration: BoxDecoration(
          color:
              context.toColor(APPLICATION_COLOR.EXTRA_CLOSE_BACKGROUND_COLOR),
          borderRadius: BorderRadius.all(Radius.circular(100))),
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: context
                            .toColor(APPLICATION_COLOR.DARK)
                            .withOpacity(0.5), // Gölge rengi (şeffaflık ayarlı)
                        spreadRadius: 1, // Gölgenin yayılma çapı
                        blurRadius: 7, // Gölgenin bulanıklık çapı
                        offset: Offset(0, 7)),
                  ],
                  color: context
                      .toColor(APPLICATION_COLOR.EXTRA_CLOSE_BACKGROUND_COLOR),
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              height: 200,
              child: NormalNetworkImage(source: value.mediaItem.url)),
          Gap(context.veryLargeSpacerSize),
          LabelText(
            text: value.name,
            textColor: APPLICATION_COLOR.OPPOSITE_COLOR,
            fontSize: FONT_SIZE.HEADLINE_MEDIUM,
          ),
        ],
      ),
    );
  }
}
