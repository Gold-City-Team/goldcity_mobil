import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/presentation/project/template/feature_template/widget/features_widget.dart';
import 'package:goldcity/view/presentation/project/template/feature_template/view_model/future_template_view_model.dart';
import 'package:goldcity/view/presentation/project/template/feature_template/widget/background_widget.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class FutureTemplateView extends StatelessWidget {
  FutureTemplateView({super.key});
  final List<String> deneme = [
    "https://metrovacesa.com/wp-content/uploads/2024/05/W1P6i31-089sev_18_terraza_02-1920x1080.jpg",
    "https://i.pinimg.com/originals/88/19/6b/88196bee32be9593a9b77cc3137433a1.jpg",
    "https://mir-s3-cdn-cf.behance.net/project_modules/fs/c6b16a43564835.57f4204982235.jpg",
    "https://urvission.com/wp-content/uploads/2022/07/Luxury_modern_bathroom_Lauderdale_London_Urvission_Interiors.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return BaseView<FutureTemplateViewModel>(
      viewModel: FutureTemplateViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, FutureTemplateViewModel value) =>
          Scaffold(
              body: isTablet()
                  ? tabletView(context, value)
                  : phoneView(context, value)),
    );
  }

  Widget phoneView(BuildContext context, FutureTemplateViewModel value) {
    return SingleChildScrollView(
      child: Column(
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
                  "• 60 residences in 3 blocks with open pool in the Goldcity Trio Hill project.\n\n• 1+1 Residence; 1 bathroom, 1 living room, 1 bathroom, open kitchen, terrace.",
              fontSize: FONT_SIZE.LABEL_LARGE,
              textColor: APPLICATION_COLOR.SUBTITLE,
            ),
          ).animate().fade(),
          Gap(context.midSpacerSize),
          Observer(builder: (context) {
            if (value.projectEntity == null) {
              return const SizedBox.shrink();
            }
            return SizedBox(
              width: 400,
              child: Wrap(
                children: value.projectEntity!.detail.features
                    .map((e) => FeaturesWidget(featuresEntity: e))
                    .toSet()
                    .toList(),
              ),
            );
          })
        ],
      ),
    );
  }

  Widget tabletView(BuildContext context, FutureTemplateViewModel value) {
    return Stack(
      children: [
        const BackgroundWidget(),
        SingleChildScrollView(
          child: SafeArea(
            child: Container(
              width: context.sWidth / 2,
              margin: context.largeSpacer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: context.largeSpacerOnlyLeft,
                    child: const LabelText(
                      text: "TRIO HILL RESIDENCE",
                      fontSize: FONT_SIZE.HEADLINE_LARGE,
                    ),
                  ),
                  Gap(context.midSpacerSize),
                  Padding(
                    padding: context.largeSpacerOnlyLeft,
                    child: const LabelText(
                      text:
                          "A world of its own that sits on an area of 211.677 m2. Lorem ipsum dolor sit amet",
                      fontSize: FONT_SIZE.BODY_LARGE,
                      textColor: APPLICATION_COLOR.SUBTITLE,
                    ),
                  ),
                  Gap(context.veryLargeSpacerSize),
                  Observer(builder: (context) {
                    if (value.projectEntity == null) {
                      return const SizedBox.shrink();
                    }
                    return SizedBox(
                      width: 400,
                      child: Wrap(
                        children: value.projectEntity!.detail.features
                            .map((e) => FeaturesWidget(featuresEntity: e))
                            .toSet()
                            .toList(),
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
