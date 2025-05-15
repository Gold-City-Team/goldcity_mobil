import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/presentation/our_services/purchase/view_model/purchase_view_model.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class PurchaseView extends StatelessWidget {
  const PurchaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PurchaseViewModel>(
      viewModel: PurchaseViewModel(),
      onModelReady: (model) {
        model.init();
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, PurchaseViewModel value) => Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: context.sWidth / 1.4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              firstPart(context),
              Gap(context.veryLargeSpacerSize),
              Divider(
                color: context.toColor(APPLICATION_COLOR.LIGHT),
              ),
              Gap(context.veryLargeSpacerSize),
              middlePart(context),
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
      SizedBox(width: context.sWidth / 3, child: NormalNetworkImage(source: "https://condominium.zafercetin.dev/trio.jpg")),
      Gap(context.xlargeSpacerSize),
      Expanded(
        child: LabelText(
          text: context.tr("ourServicesTab1Paragraph0"),
          fontWeight: FontWeight.w400,
          fontSize: FONT_SIZE.TITLE_MEDIUM,
          textLineHeight: 2,
          wordSpacing: 3,
        ),
      ),
    ],
  );
}

Widget middlePart(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(width: context.sWidth / 3, child: NormalNetworkImage(source: "https://condominium.zafercetin.dev/lejardin.jpg")),
      Gap(context.xlargeSpacerSize),
      Expanded(
        child: LabelText(
          text: context.tr("ourServicesTab1Paragraph1"),
          fontWeight: FontWeight.w400,
          fontSize: FONT_SIZE.TITLE_MEDIUM,
          textLineHeight: 2,
          wordSpacing: 3,
        ),
      ),
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
          children: [
            LabelText(
              text: "${context.tr("ourServicesTab1Paragraph2Title")}\n\n${context.tr("ourServicesTab1Paragraph2Paragraph0")}",
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
                    text: context.tr("ourServicesTab1Paragraph2List0"),
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
                    text: context.tr("ourServicesTab1Paragraph2List1"),
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
                    text: context.tr("ourServicesTab1Paragraph2List2"),
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
                    text: context.tr("ourServicesTab1Paragraph2List3"),
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
                    text: context.tr("ourServicesTab1Paragraph2List4"),
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
                    text: context.tr("ourServicesTab1Paragraph2List5"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
            Gap(context.midSpacerSize),
            LabelText(
              text: context.tr("ourServicesTab1Paragraph2Paragraph1"),
              fontWeight: FontWeight.w400,
              fontSize: FONT_SIZE.TITLE_MEDIUM,
              textLineHeight: 2,
              wordSpacing: 3,
            ),
          ],
        ),
      )
    ],
  );
}
