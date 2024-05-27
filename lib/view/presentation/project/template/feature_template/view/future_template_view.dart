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
    return SafeArea(
      top: false,
      bottom: true,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Observer(builder: (context) {
                  if (value.templateEntity == null) {
                    return const SizedBox.shrink();
                  }
                  return SizedBox(
                    width: context.sWidth,
                    height: context.sWidth / 1.7777,
                    child: NormalNetworkImage(
                        source: value.templateEntity!.mediaItem.url,
                        fit: BoxFit.cover),
                  );
                }),
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
            Observer(builder: (context) {
              if (value.templateEntity == null) {
                return const SizedBox.shrink();
              }
              return Padding(
                padding: context.largeSpacerOnlyHorizontal,
                child: LabelText(
                  text: value.templateEntity!.title,
                  fontSize: FONT_SIZE.HEADLINE_LARGE,
                ),
              ).animate().fade();
            }),
            Gap(context.midSpacerSize),
            Observer(builder: (context) {
              if (value.templateEntity == null) {
                return const SizedBox.shrink();
              }
              return Padding(
                padding: context.largeSpacerOnlyHorizontal,
                child: LabelText(
                  text: value.templateEntity!.description,
                  fontSize: FONT_SIZE.LABEL_LARGE,
                  textColor: APPLICATION_COLOR.SUBTITLE,
                ),
              ).animate().fade();
            }),
            Gap(context.midSpacerSize),
            Observer(builder: (context) {
              if (value.templateEntity == null) {
                return const SizedBox.shrink();
              }
              return Padding(
                padding: context.midSpacerOnlyHorizontal,
                child: Wrap(
                  children: value.templateEntity!.features
                      .map((e) => FeaturesWidget(featuresEntity: e))
                      .toSet()
                      .toList(),
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  Widget tabletView(BuildContext context, FutureTemplateViewModel value) {
    return Stack(
      children: [
        Observer(builder: (context) {
          if (value.templateEntity == null) {
            return const SizedBox.shrink();
          }
          return BackgroundWidget(
              backgroundImage: value.templateEntity!.mediaItem.url);
        }),
        SingleChildScrollView(
          child: SafeArea(
            child: Container(
              width: context.sWidth / 2,
              margin: context.largeSpacer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Observer(builder: (context) {
                    if (value.templateEntity == null) {
                      return const SizedBox.shrink();
                    }
                    return Padding(
                      padding: context.largeSpacerOnlyLeft,
                      child: LabelText(
                        text: value.templateEntity!.title,
                        fontSize: FONT_SIZE.HEADLINE_LARGE,
                      ),
                    );
                  }),
                  Gap(context.midSpacerSize),
                  Observer(builder: (context) {
                    if (value.templateEntity == null) {
                      return const SizedBox.shrink();
                    }
                    return Padding(
                      padding: context.largeSpacerOnlyLeft,
                      child: LabelText(
                        text: value.templateEntity!.description,
                        fontSize: FONT_SIZE.BODY_LARGE,
                        textColor: APPLICATION_COLOR.SUBTITLE,
                      ),
                    );
                  }),
                  Gap(context.veryLargeSpacerSize),
                  Observer(builder: (context) {
                    if (value.templateEntity == null) {
                      return const SizedBox.shrink();
                    }
                    return Wrap(
                      children: value.templateEntity!.features
                          .map((e) => FeaturesWidget(featuresEntity: e))
                          .toSet()
                          .toList(),
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
