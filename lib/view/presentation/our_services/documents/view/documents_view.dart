import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/presentation/our_services/documents/view_model/documents_view_model.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class DocumentsView extends StatelessWidget {
  const DocumentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<DocumentsViewModel>(
      viewModel: DocumentsViewModel(),
      onModelReady: (model) {
        model.init();
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, DocumentsViewModel value) => Align(
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
              LabelText(
                text: context.tr("ourServicesTab2Title0"),
                fontWeight: FontWeight.w400,
                fontSize: FONT_SIZE.TITLE_MEDIUM,
                textLineHeight: 2,
                wordSpacing: 3,
              ),
              Gap(context.midSpacerSize),
              LabelText(
                text: context.tr("ourServicesTab2Paragraph0"),
                fontWeight: FontWeight.w400,
                fontSize: FONT_SIZE.TITLE_MEDIUM,
                textLineHeight: 2,
                wordSpacing: 3,
              ),
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
              text: context.tr("ourServicesTab2Paragraph0Title0"),
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
                    text: context.tr("ourServicesTab2Paragraph0List0"),
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
                    text: context.tr("ourServicesTab2Paragraph0List1"),
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
                    text: context.tr("ourServicesTab2Paragraph0List2"),
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
                    text: context.tr("ourServicesTab2Paragraph0List3"),
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
                    text: context.tr("ourServicesTab2Paragraph0List4"),
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
                    text: context.tr("ourServicesTab2Paragraph0List5"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
            Gap(context.midSpacerSize),
            LabelText(
              text: context.tr("ourServicesTab2Paragraph0Title1"),
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
                    text: context.tr("ourServicesTab2Paragraph0List6"),
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
                    text: context.tr("ourServicesTab2Paragraph0List7"),
                    fontWeight: FontWeight.w400,
                    fontSize: FONT_SIZE.TITLE_MEDIUM,
                  ),
                ),
              ],
            ),
            Gap(context.midSpacerSize),
            LabelText(
              text: context.tr("ourServicesTab2Paragraph0Paragraph0"),
              fontWeight: FontWeight.w400,
              fontSize: FONT_SIZE.TITLE_MEDIUM,
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
              text: context.tr("ourServicesTab2Paragraph1Title0"),
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
                    text: context.tr("ourServicesTab2Paragraph1List0"),
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
                    text: context.tr("ourServicesTab2Paragraph1List1"),
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
                    text: context.tr("ourServicesTab2Paragraph1List2"),
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
                    text: context.tr("ourServicesTab2Paragraph1List3"),
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
                    text: context.tr("ourServicesTab2Paragraph1List4"),
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
                    text: context.tr("ourServicesTab2Paragraph1List5"),
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
                    text: context.tr("ourServicesTab2Paragraph1List6"),
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
                    text: context.tr("ourServicesTab2Paragraph1List7"),
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
                    text: context.tr("ourServicesTab2Paragraph1List8"),
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
