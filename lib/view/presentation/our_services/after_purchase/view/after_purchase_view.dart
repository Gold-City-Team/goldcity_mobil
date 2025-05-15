import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/presentation/our_services/after_purchase/view_model/after_purchase_view_model.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class AfterPurchaseView extends StatelessWidget {
  const AfterPurchaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<AfterPurchaseViewModel>(
      viewModel: AfterPurchaseViewModel(),
      onModelReady: (model) {
        model.init();
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, AfterPurchaseViewModel value) => Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: context.sWidth / 1.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              firstPart(context),
              Gap(context.veryLargeSpacerSize),
              Divider(
                color: context.toColor(APPLICATION_COLOR.LIGHT),
              ),
              Gap(context.veryLargeSpacerSize),
              lastPart(context),
              Gap(context.veryLargeSpacerSize),
            ],
          ),
        ),
      ),
    );
  }
}

Widget firstPart(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(width: context.sWidth / 3, child: NormalNetworkImage(source: "https://condominium.zafercetin.dev/gc.jpg")),
      Gap(context.xlargeSpacerSize),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabelText(
              text: context.tr("ourServicesTab3Paragraph0Title0"),
              fontWeight: FontWeight.w500,
              fontSize: FONT_SIZE.TITLE_MEDIUM,
              textLineHeight: 2,
              wordSpacing: 3,
            ),
            Gap(context.midSpacerSize),
            LabelText(
              text: context.tr("ourServicesTab3Paragraph0Paragraph0"),
              fontWeight: FontWeight.w400,
              fontSize: FONT_SIZE.TITLE_MEDIUM,
              textLineHeight: 2,
              wordSpacing: 3,
            ),
            Gap(context.midSpacerSize),
            LabelText(
              text: context.tr("ourServicesTab3Paragraph0Title1"),
              fontWeight: FontWeight.w500,
              fontSize: FONT_SIZE.TITLE_MEDIUM,
              textLineHeight: 2,
              wordSpacing: 3,
            ),
            Gap(context.midSpacerSize),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
                Gap(context.midSpacerSize),
                Expanded(
                  child: LabelText(
                    text: context.tr("ourServicesTab3Paragraph0List0"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
            Gap(context.midSpacerSize),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
                Gap(context.midSpacerSize),
                Expanded(
                  child: LabelText(
                    text: context.tr("ourServicesTab3Paragraph0List1"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
            Gap(context.midSpacerSize),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
                Gap(context.midSpacerSize),
                Expanded(
                  child: LabelText(
                    text: context.tr("ourServicesTab3Paragraph0List2"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
            Gap(context.midSpacerSize),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
                Gap(context.midSpacerSize),
                Expanded(
                  child: LabelText(
                    text: context.tr("ourServicesTab3Paragraph0List3"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
            Gap(context.midSpacerSize),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
                Gap(context.midSpacerSize),
                Expanded(
                  child: LabelText(
                    text: context.tr("ourServicesTab3Paragraph0List4"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
            Gap(context.midSpacerSize),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
                Gap(context.midSpacerSize),
                Expanded(
                  child: LabelText(
                    text: context.tr("ourServicesTab3Paragraph0List5"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
            Gap(context.midSpacerSize),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
                Gap(context.midSpacerSize),
                Expanded(
                  child: LabelText(
                    text: context.tr("ourServicesTab3Paragraph0List6"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
            Gap(context.midSpacerSize),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
                Gap(context.midSpacerSize),
                Expanded(
                  child: LabelText(
                    text: context.tr("ourServicesTab3Paragraph0List7"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
            Gap(context.midSpacerSize),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
                Gap(context.midSpacerSize),
                Expanded(
                  child: LabelText(
                    text: context.tr("ourServicesTab3Paragraph0List8"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
            Gap(context.midSpacerSize),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
                Gap(context.midSpacerSize),
                Expanded(
                  child: LabelText(
                    text: context.tr("ourServicesTab3Paragraph0List9"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
            Gap(context.midSpacerSize),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
                Gap(context.midSpacerSize),
                Expanded(
                  child: LabelText(
                    text: context.tr("ourServicesTab3Paragraph0List10"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
            Gap(context.midSpacerSize),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
                Gap(context.midSpacerSize),
                Expanded(
                  child: LabelText(
                    text: context.tr("ourServicesTab3Paragraph0List11"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
            Gap(context.midSpacerSize),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
                Gap(context.midSpacerSize),
                Expanded(
                  child: LabelText(
                    text: context.tr("ourServicesTab3Paragraph0List12"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
            Gap(context.midSpacerSize),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
                Gap(context.midSpacerSize),
                Expanded(
                  child: LabelText(
                    text: context.tr("ourServicesTab3Paragraph0List13"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
            Gap(context.midSpacerSize),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
                Gap(context.midSpacerSize),
                Expanded(
                  child: LabelText(
                    text: context.tr("ourServicesTab3Paragraph0List14"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    ],
  );
}

Widget lastPart(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(width: context.sWidth / 3, child: NormalNetworkImage(source: "https://condominium.zafercetin.dev/gc.jpg")),
      Gap(context.xlargeSpacerSize),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabelText(
              text: context.tr("ourServicesTab3Paragraph1Title0"),
              fontWeight: FontWeight.w400,
              fontSize: FONT_SIZE.TITLE_MEDIUM,
              textLineHeight: 2,
              wordSpacing: 3,
            ),
            Gap(context.midSpacerSize),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
                Gap(context.midSpacerSize),
                Expanded(
                  child: LabelText(
                    text: context.tr("ourServicesTab3Paragraph1List0"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
            Gap(context.midSpacerSize),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
                Gap(context.midSpacerSize),
                Expanded(
                  child: LabelText(
                    text: context.tr("ourServicesTab3Paragraph1List1"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
            Gap(context.midSpacerSize),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
                Gap(context.midSpacerSize),
                Expanded(
                  child: LabelText(
                    text: context.tr("ourServicesTab3Paragraph1List2"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
            Gap(context.midSpacerSize),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
                Gap(context.midSpacerSize),
                Expanded(
                  child: LabelText(
                    text: context.tr("ourServicesTab3Paragraph1List3"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
            Gap(context.midSpacerSize),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
                Gap(context.midSpacerSize),
                Expanded(
                  child: LabelText(
                    text: context.tr("ourServicesTab3Paragraph1List4"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
            Gap(context.midSpacerSize),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
                Gap(context.midSpacerSize),
                Expanded(
                  child: LabelText(
                    text: context.tr("ourServicesTab3Paragraph1List5"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
            Gap(context.midSpacerSize),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
                Gap(context.midSpacerSize),
                Expanded(
                  child: LabelText(
                    text: context.tr("ourServicesTab3Paragraph1List6"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
            Gap(context.midSpacerSize),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
                Gap(context.midSpacerSize),
                Expanded(
                  child: LabelText(
                    text: context.tr("ourServicesTab3Paragraph1List7"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
            Gap(context.midSpacerSize),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
                Gap(context.midSpacerSize),
                Expanded(
                  child: LabelText(
                    text: context.tr("ourServicesTab3Paragraph1List8"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
            Gap(context.midSpacerSize),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
                Gap(context.midSpacerSize),
                Expanded(
                  child: LabelText(
                    text: context.tr("ourServicesTab3Paragraph1List9"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
            Gap(context.midSpacerSize),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
                Gap(context.midSpacerSize),
                Expanded(
                  child: LabelText(
                    text: context.tr("ourServicesTab3Paragraph1List10"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
            Gap(context.midSpacerSize),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
                Gap(context.midSpacerSize),
                Expanded(
                  child: LabelText(
                    text: context.tr("ourServicesTab3Paragraph1List11"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
            Gap(context.midSpacerSize),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
                Gap(context.midSpacerSize),
                Expanded(
                  child: LabelText(
                    text: context.tr("ourServicesTab3Paragraph1List12"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    ],
  );
}
