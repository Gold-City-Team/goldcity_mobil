import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/presentation/project/template/project_animated_wellcome_template/view_model/project_animated_wellcome_template_view_model.dart';
import 'package:goldcity/view/widget/features/features_widget.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';

class ProjectAnimatedWellcomeTemplateView extends StatelessWidget {
  final int projectSettingsId;

  const ProjectAnimatedWellcomeTemplateView(
      {required this.projectSettingsId, super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProjectAnimatedWellcomeTemplateViewModel>(
      viewModel: ProjectAnimatedWellcomeTemplateViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.projectSettingsId = projectSettingsId;
        model.init();
      },
      onPageBuilder: (BuildContext context,
              ProjectAnimatedWellcomeTemplateViewModel value) =>
          Scaffold(
              body: isTablet()
                  ? tabletView(context, value)
                  : phoneView(context, value)),
    );
  }

  Widget phoneView(
      BuildContext context, ProjectAnimatedWellcomeTemplateViewModel value) {
    return Stack(
      children: [
        Observer(builder: (context) {
          if (value.templateEntity == null) {
            return const SizedBox.shrink();
          }
          return SizedBox(
            width: context.sWidth,
            height: context.sHeight,
            child: NormalNetworkImage(
              source: value.templateEntity!.mainImage.url,
            ),
          );
        }),
        Container(
          color: context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
          width: context.sWidth,
          height: context.sHeight,
        ).animate(delay: const Duration(milliseconds: 100)).slideX(
            begin: 0.2,
            end: 1,
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeOutCubic),
        SizedBox(
          width: context.sWidth,
          height: context.sHeight,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    context.toColor(
                      APPLICATION_COLOR.OVERLAY_COLOR,
                    ),
                    context
                        .toColor(APPLICATION_COLOR.OVERLAY_COLOR)
                        .withAlpha(200),
                    context
                        .toColor(APPLICATION_COLOR.OVERLAY_COLOR)
                        .withAlpha(190),
                    context
                        .toColor(APPLICATION_COLOR.OVERLAY_COLOR)
                        .withAlpha(150),
                    context
                        .toColor(APPLICATION_COLOR.OVERLAY_COLOR)
                        .withAlpha(0),
                  ],
                ),
              ),
            )
                .animate(delay: const Duration(milliseconds: 1500))
                .fade(duration: const Duration(milliseconds: 1500)),
          ),
        ),
        Observer(builder: (context) {
          if (value.templateEntity == null) {
            return const SizedBox.shrink();
          }
          return Padding(
            padding: context.largeSpacerOnlyHorizontal,
            child: SizedBox(
              width: context.sWidth,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: context.sWidth / 2,
                      child: NormalNetworkImage(
                        fit: BoxFit.contain,
                        source: value.templateEntity!.logo.url,
                      ),
                    )
                        .animate(delay: const Duration(milliseconds: 1500))
                        .fade(duration: const Duration(milliseconds: 1500)),
                    Gap(context.largeSpacerSize),
                    SizedBox(
                      width: context.sWidth,
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        runSpacing: 0,
                        spacing: 0,
                        runAlignment: WrapAlignment.start,
                        direction: Axis.horizontal,
                        children: value.templateEntity!.features
                            .map((e) => Container(
                                width: (context.sWidth / 2) - 15,
                                alignment: Alignment.centerLeft,
                                child: FeaturesWidget(featuresEntity: e)))
                            .toSet()
                            .toList(),
                      ),
                    ),
                    Gap(context.veryLargeSpacerSize),
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget tabletView(
      BuildContext context, ProjectAnimatedWellcomeTemplateViewModel value) {
    return SizedBox(
      width: context.sWidth,
      height: context.sHeight,
      child: Stack(
        children: [
          Observer(builder: (context) {
            if (value.templateEntity == null) {
              return const SizedBox.shrink();
            }
            return SizedBox(
              width: context.sWidth,
              height: context.sHeight,
              child: NormalNetworkImage(
                source: value.templateEntity!.mainImage.url,
              ),
            );
          }),
          Container(
            color: context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
            width: context.sWidth,
            height: context.sHeight,
          ).animate(delay: const Duration(milliseconds: 100)).slideX(
              begin: 0.2,
              end: 1,
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeOutCubic),
          SizedBox(
            width: context.sWidth / 2,
            height: context.sHeight,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      context.toColor(
                        APPLICATION_COLOR.OVERLAY_COLOR,
                      ),
                      context
                          .toColor(APPLICATION_COLOR.OVERLAY_COLOR)
                          .withAlpha(170),
                      context
                          .toColor(APPLICATION_COLOR.OVERLAY_COLOR)
                          .withAlpha(120),
                      context
                          .toColor(APPLICATION_COLOR.OVERLAY_COLOR)
                          .withAlpha(0),
                    ],
                  ),
                ),
              ),
            ),
          )
              .animate(delay: const Duration(milliseconds: 1500))
              .fade(duration: const Duration(milliseconds: 1500)),
          Observer(builder: (context) {
            if (value.templateEntity == null) {
              return const SizedBox.shrink();
            }
            return Padding(
              padding: context.largeSpacerOnlyHorizontal,
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: context.sWidth / 4,
                        child: NormalNetworkImage(
                          fit: BoxFit.contain,
                          source: value.templateEntity!.logo.url,
                        ),
                      )
                          .animate(delay: const Duration(milliseconds: 1500))
                          .fade(duration: const Duration(milliseconds: 1500)),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: context.sWidth / 4,
                        height: context.sHeight / 3,
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          runAlignment: WrapAlignment.start,
                          direction: Axis.vertical,
                          children: value.templateEntity!.features
                              .map((e) => Container(
                                  height: (context.sHeight / 3) / 3,
                                  padding: context.midSpacer,
                                  alignment: Alignment.centerLeft,
                                  child: FeaturesWidget(featuresEntity: e)))
                              .toSet()
                              .toList(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
