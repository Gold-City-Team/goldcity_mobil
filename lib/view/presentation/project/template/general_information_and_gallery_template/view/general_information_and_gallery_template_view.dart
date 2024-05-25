import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/presentation/project/template/general_information_and_gallery_template/view_model/general_information_and_gallery_template_view_model.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class GeneralInformationAndGalleryTemplateView extends StatelessWidget {
  GeneralInformationAndGalleryTemplateView({super.key});
  final List<String> deneme = [
    "https://metrovacesa.com/wp-content/uploads/2024/05/W1P6i31-089sev_18_terraza_02-1920x1080.jpg",
    "https://i.pinimg.com/originals/88/19/6b/88196bee32be9593a9b77cc3137433a1.jpg",
    "https://mir-s3-cdn-cf.behance.net/project_modules/fs/c6b16a43564835.57f4204982235.jpg",
    "https://urvission.com/wp-content/uploads/2022/07/Luxury_modern_bathroom_Lauderdale_London_Urvission_Interiors.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return BaseView<GeneralInformationAndGalleryTemplateViewModel>(
      viewModel: GeneralInformationAndGalleryTemplateViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context,
              GeneralInformationAndGalleryTemplateViewModel value) =>
          Scaffold(
        body: SingleChildScrollView(
            child: isTablet()
                ? SafeArea(child: tabletView(context, value))
                : phoneView(context, value)),
      ),
    );
  }

  Widget phoneView(BuildContext context,
      GeneralInformationAndGalleryTemplateViewModel value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            SizedBox(
              width: context.sWidth,
              height: context.sWidth / 1.7777,
              child: NormalNetworkImage(source: deneme[0], fit: BoxFit.cover),
            ),
            Container(
              width: context.sWidth,
              height: context.sWidth / 1.7777,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    tileMode: TileMode.clamp),
              ),
            ),
          ],
        ).animate().fade(),
        Gap(context.largeSpacerSize),
        Padding(
          padding: context.largeSpacerOnlyHorizontal,
          child: const LabelText(
            text: "TRIO HILL RESIDENCE",
            fontSize: FONT_SIZE.HEADLINE_LARGE,
          ),
        ).animate().fade(),
        Gap(context.midSpacerSize),
        Padding(
          padding: context.largeSpacerOnlyHorizontal,
          child: const LabelText(
            text: "Genel Bilgiler",
            fontSize: FONT_SIZE.TITLE_LARGE,
            textColor: APPLICATION_COLOR.TITLE,
          ),
        ).animate().fade(),
        Gap(context.largeSpacerSize),
        Padding(
          padding: context.largeSpacerOnlyHorizontal,
          child: const LabelText(
            text:
                "• 60 residences in 3 blocks with open pool in the Goldcity Trio Hill project.\n\n• 1+1 Residence; 1 bathroom, 1 living room, 1 bathroom, open kitchen, terrace.\n\n• 2+1 Duplex Residence; 2 bedroom, 2 bathroom, open kitchen, 1 living room, 1 WC\n\n• 3+1 Duplex Residence; 3 bedroom, 3 bathroom, 1 WC, open kitchen, 1 living room",
            fontSize: FONT_SIZE.LABEL_LARGE,
            textColor: APPLICATION_COLOR.SUBTITLE,
          ),
        ).animate().fade(),
        Gap(context.largeSpacerSize),
        Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 0,
            children: deneme
                .map((e) => GestureDetector(
                      onTap: () => value.navigateGallery(),
                      child: Padding(
                        padding: context.midSpacerOnlyBottom,
                        child: SizedBox(
                          width: (context.sWidth / 2) - 20,
                          height: ((context.sWidth / 2) - 20) / 1.7777,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Container(
                              color: context.toColor(APPLICATION_COLOR.DARK),
                              child: NormalNetworkImage(
                                fit: BoxFit.cover,
                                source: deneme[Random().nextInt(deneme.length)],
                              ),
                            ),
                          ).animate().fade(),
                        ),
                      ),
                    ))
                .toList(),
          ),
        )
      ],
    );
  }

  Widget tabletView(BuildContext context,
      GeneralInformationAndGalleryTemplateViewModel value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: context.sHeight - 350,
          ),
          child: Padding(
            padding: context.largeSpacer,
            child: Row(
              children: [
                SizedBox(
                  width: context.sWidth / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: context.largeSpacerOnlyLeft,
                        child: const LabelText(
                          text: "TRIO HILL RESIDENCE",
                          fontSize: FONT_SIZE.HEADLINE_LARGE,
                        ),
                      ).animate().fade(),
                      Gap(context.midSpacerSize),
                      Padding(
                        padding: context.largeSpacerOnlyLeft,
                        child: const LabelText(
                          text: "Genel Bilgiler",
                          fontSize: FONT_SIZE.TITLE_LARGE,
                          textColor: APPLICATION_COLOR.TITLE,
                        ),
                      ).animate().fade(),
                      Gap(context.largeSpacerSize),
                      Padding(
                        padding: context.largeSpacerOnlyLeft,
                        child: const LabelText(
                          text:
                              "• 60 residences in 3 blocks with open pool in the Goldcity Trio Hill project.\n\n• 1+1 Residence; 1 bathroom, 1 living room, 1 bathroom, open kitchen, terrace.\n\n• 2+1 Duplex Residence; 2 bedroom, 2 bathroom, open kitchen, 1 living room, 1 WC\n\n• 3+1 Duplex Residence; 3 bedroom, 3 bathroom, 1 WC, open kitchen, 1 living room",
                          fontSize: FONT_SIZE.LABEL_LARGE,
                          textColor: APPLICATION_COLOR.SUBTITLE,
                        ),
                      ).animate().fade(),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: SizedBox(
                      width: (context.sWidth / 2) - 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: NormalNetworkImage(source: deneme[0]),
                      ),
                    ),
                  ),
                ).animate().fade()
              ],
            ),
          ),
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [1, 1, 1, 1, 1, 1, 1]
              .map(
                (e) => GestureDetector(
                  onTap: () => value.navigateGallery(),
                  child: SizedBox(
                    width: context.sWidth / 3 - 20,
                    height: (context.sWidth / 3 - 20) / 1.7777,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        color: context.toColor(APPLICATION_COLOR.DARK),
                        child: NormalNetworkImage(
                          fit: BoxFit.cover,
                          source: deneme[Random().nextInt(deneme.length)],
                        ),
                      ),
                    ),
                  ).animate().fade(),
                ),
              )
              .toList(),
        )
      ],
    );
  }
}
