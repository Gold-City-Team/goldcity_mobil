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
      onPageBuilder: (BuildContext context, CitizenshipPageViewModel value) => Padding(
        padding: context.midSpacerOnlyHorizontal,
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
    );
  }

  Widget leftPart(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelText(
          text: "Turkish Citizenship",
          fontWeight: FontWeight.w600,
          fontSize: FONT_SIZE.TITLE_LARGE,
          textColor: APPLICATION_COLOR.LIGHT,
        ),
        Gap(context.largeSpacerSize),
        LabelText(
          text:
              "Since 18 September 2018, changes have been made in the laws regarding the acquisition of Turkish citizenship by foreigners. According to these changes, foreigners who meet one of the following criteria and make investments are entitled to Turkish citizenship.",
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
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.check, color: context.toColor(APPLICATION_COLOR.GOLD)),
            Gap(context.midSpacerSize),
            Expanded(
              child: LabelText(
                text:
                    'Real estate investment of \$400,000 in Turkey, provided that the property is not sold for 3 years. (May be one or more properties, total value is what counts)',
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
                text: 'Establishing or purchasing a company with a capital of \$500,000 or more, provided that it does not sell for 3 years.',
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
                text: 'Invest \$500,000 or more in government investments or public banks, provided that it is not withdrawn for 3 years.',
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
                text:
                    'Real estate investment should be made in accordance with Turkish laws and regulations. Foreigners can invest in residential properties, commercial buildings, land or farmland to meet the requirements. While making this investment, they are required to transfer the title deeds of the real estate they are purchasing at the land registry offices on their own behalf.',
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
                text:
                    'To apply for Turkish citizenship, the applicant must have a valid residence permit or a blue identity card. When applying for citizenship, wife or husband of the person and their children under the age of 18 can also apply with them. In other words, it is sufficient for one person in the family to make an investment in order to apply for Turkish citizenship.',
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
                text:
                    'It is not possible to apply directly to the General Directorate of Internal Affairs, Population and Citizenship Affairs Office for Turkish citizenship, all applications must be processed by authorized lawyers. The application is usually concluded within 2 months if the application is made with all the correct supporting documents as per the requirements of the law.',
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
                text:
                    'Required documents for Turkish citizenship application include passport, residence permit or work permit, photographs of the applicant, and birth certificate. More documents can be requested. The applicant or persons must not pose a threat to Turkey\'s national security. They should be sure that the documents and information they submit during their application are correct.',
                fontWeight: FontWeight.w400,
                fontSize: FONT_SIZE.TITLE_MEDIUM,
              ),
            ),
          ],
        ),
        Gap(context.midSpacerSize),
        LabelText(
          text:
              'While making your investment in Turkey with Goldcity Real Estate, your sales representative will be with you every step of the way and assist you in all procedures, including the application for Turkish Citizenship.',
          fontWeight: FontWeight.w600,
          fontSize: FONT_SIZE.TITLE_MEDIUM,
          textColor: APPLICATION_COLOR.LIGHT,
        ),
        Gap(context.veryLargeSpacerSize),
      ],
    );
  }
}
