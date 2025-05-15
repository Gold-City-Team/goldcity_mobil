import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/presentation/our_services/citizenship_page/view_model/citizenship_page_view_model.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class CitizenshipPageView extends StatelessWidget {
  const CitizenshipPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<CitizenshipPageViewModel>(
      viewModel: CitizenshipPageViewModel(),
      onModelReady: (model) {
        model.init();
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, CitizenshipPageViewModel value) => Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: context.sWidth / 1.4,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: leftPart(context)),
              Gap(context.largeSpacerSize),
              Expanded(child: rightPart(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget leftPart(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelText(
          text: context.tr("ourServicesTab0LeftTitle"),
          fontWeight: FontWeight.w600,
          fontSize: FONT_SIZE.TITLE_LARGE,
          textColor: APPLICATION_COLOR.LIGHT,
        ),
        Gap(context.largeSpacerSize),
        LabelText(
          text: context.tr("ourServicesTab0LeftParagraph"),
          fontWeight: FontWeight.w400,
          fontSize: FONT_SIZE.TITLE_MEDIUM,
        ),
        Gap(context.largeSpacerSize),
        NormalNetworkImage(source: "https://condominium.zafercetin.dev/turkish-citizenship.jpg"),
        Gap(context.veryLargeSpacerSize),
      ],
    );
  }

  Widget rightPart(BuildContext context) {
    return Padding(
      padding: context.midSpacerOnlyRight,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
              Gap(context.midSpacerSize),
              Expanded(
                child: LabelText(
                  text: context.tr("ourServicesTab0Right0"),
                  fontWeight: FontWeight.w400,
                  fontSize: FONT_SIZE.TITLE_MEDIUM,
                ),
              ),
            ],
          ),
          Gap(context.largeSpacerSize),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
              Gap(context.midSpacerSize),
              Expanded(
                child: LabelText(
                  text: context.tr("ourServicesTab0Right1"),
                  fontWeight: FontWeight.w400,
                  fontSize: FONT_SIZE.TITLE_MEDIUM,
                ),
              ),
            ],
          ),
          Gap(context.largeSpacerSize),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
              Gap(context.midSpacerSize),
              Expanded(
                child: LabelText(
                  text: context.tr("ourServicesTab0Right2"),
                  fontWeight: FontWeight.w400,
                  fontSize: FONT_SIZE.TITLE_MEDIUM,
                ),
              ),
            ],
          ),
          Gap(context.largeSpacerSize),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
              Gap(context.midSpacerSize),
              Expanded(
                child: LabelText(
                  text: context.tr("ourServicesTab0Right3"),
                  fontWeight: FontWeight.w400,
                  fontSize: FONT_SIZE.TITLE_MEDIUM,
                ),
              ),
            ],
          ),
          Gap(context.largeSpacerSize),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
              Gap(context.midSpacerSize),
              Expanded(
                child: LabelText(
                  text: context.tr("ourServicesTab0Right4"),
                  fontWeight: FontWeight.w400,
                  fontSize: FONT_SIZE.TITLE_MEDIUM,
                ),
              ),
            ],
          ),
          Gap(context.largeSpacerSize),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
              Gap(context.midSpacerSize),
              Expanded(
                child: LabelText(
                  text: context.tr("ourServicesTab0Right5"),
                  fontWeight: FontWeight.w400,
                  fontSize: FONT_SIZE.TITLE_MEDIUM,
                ),
              ),
            ],
          ),
          Gap(context.largeSpacerSize),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
              Gap(context.midSpacerSize),
              Expanded(
                child: LabelText(
                  text: context.tr("ourServicesTab0Right6"),
                  fontWeight: FontWeight.w400,
                  fontSize: FONT_SIZE.TITLE_MEDIUM,
                ),
              ),
            ],
          ),
          Gap(context.largeSpacerSize),
          LabelText(
            text: context.tr("ourServicesTab0Right7"),
            fontWeight: FontWeight.w600,
            fontSize: FONT_SIZE.TITLE_MEDIUM,
            textColor: APPLICATION_COLOR.LIGHT,
          ),
          Gap(context.veryLargeSpacerSize),
        ],
      ),
    );
  }
}
