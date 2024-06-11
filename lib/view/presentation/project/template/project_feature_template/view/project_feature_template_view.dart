import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/presentation/project/template/project_feature_template/view_model/project_feature_template_view_model.dart';
import 'package:goldcity/view/presentation/project/template/project_feature_template/widget/background_widget.dart';
import 'package:goldcity/view/widget/features/features_widget.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class ProjectFeatureTemplateView extends StatelessWidget {
  final int projectDetailId;
  final int projectSettingsId;
  const ProjectFeatureTemplateView(
      {super.key,
      required this.projectDetailId,
      required this.projectSettingsId});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProjectFeatureTemplateViewModel>(
      viewModel: ProjectFeatureTemplateViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.projectDetailId = projectDetailId;
        model.projectSettingsId = projectSettingsId;
        model.init();
      },
      onPageBuilder:
          (BuildContext context, ProjectFeatureTemplateViewModel value) =>
              Scaffold(
        body:
            isTablet() ? tabletView(context, value) : phoneView(context, value),
      ),
    );
  }

  Widget phoneView(
      BuildContext context, ProjectFeatureTemplateViewModel value) {
    return SingleChildScrollView(
      padding: EdgeInsets.zero,
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
          }),
          Gap(context.veryLargeSpacerOnlyBottom.bottom)
        ],
      ),
    );
  }

  Widget tabletView(
      BuildContext context, ProjectFeatureTemplateViewModel value) {
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
                  }),
                  Gap(context.veryLargeSpacerOnlyBottom.bottom)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
