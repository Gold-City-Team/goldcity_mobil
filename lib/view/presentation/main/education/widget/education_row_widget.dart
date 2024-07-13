import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/domain/entity/education/education/education_entity.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class EducationRowWidget extends StatelessWidget {
  final VoidCallback onTap;
  final EducationEntity entity;
  final bool isReverse;
  const EducationRowWidget(
      {required this.entity,
      required this.isReverse,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    var size = (context.sHeight) -
        (MediaQuery.of(context).padding.top +
            MediaQuery.of(context).padding.bottom);
    debugPrint(
        "test ${context.sHeight} ----- ${MediaQuery.of(context).padding.top}");
    return SafeArea(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          height: context.sHeight,
          decoration: BoxDecoration(
            color: isReverse
                ? context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR)
                : context.toColor(APPLICATION_COLOR.GOLD),
          ),
          child: Column(
            verticalDirection:
                isReverse ? VerticalDirection.up : VerticalDirection.down,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: (size / 2),
                child: NormalNetworkImage(
                    source: entity.detailEntity.mainImage.url,
                    fit: BoxFit.cover),
              ),
              Container(
                height: (size / 2),
                padding: context.largeSpacerOnlyHorizontal,
                width: context.sWidth / 3,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LabelText(
                        align: TextAlign.center,
                        maxLines: 2,
                        fontWeight: FontWeight.bold,
                        text: entity.detailEntity.title,
                        textColor: APPLICATION_COLOR.OPPOSITE_COLOR,
                        fontSize: FONT_SIZE.HEADLINE_MEDIUM),
                    Gap(context.midSpacerSize),
                    LabelText(
                        text: entity.detailEntity.description,
                        maxLines: 3,
                        align: TextAlign.center,
                        textColor: APPLICATION_COLOR.OPPOSITE_COLOR,
                        fontSize: FONT_SIZE.BODY_LARGE)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
