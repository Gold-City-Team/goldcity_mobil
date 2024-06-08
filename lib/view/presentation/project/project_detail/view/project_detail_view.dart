import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/data/dto/receive/project/project_template/project_template_dto.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/presentation/project/project_detail/view_model/project_detail_view_model.dart';
import 'package:goldcity/view/presentation/project/project_detail/widget/page_selector_widget.dart';
import 'package:goldcity/view/presentation/project/template/feature_and_gallery_template/view/feature_and_gallery_template_view.dart';
import 'package:goldcity/view/presentation/project/template/feature_template/view/future_template_view.dart';
import 'package:goldcity/view/presentation/project/template/general_information_and_gallery_template/view/general_information_and_gallery_template_view.dart';
import 'package:goldcity/view/presentation/project/template/plan_template/view/plan_template_view.dart';
import 'package:goldcity/view/presentation/project/template/possibilty_template/view/possibilty_template_view.dart';
import 'package:goldcity/view/presentation/project/template/shareable_material/view/shareable_material_template_view.dart';
import 'package:goldcity/view/presentation/project/template/virtual_tour_template/view/virtual_tour_template_view.dart';

class ProjectDetailView extends StatelessWidget {
  final int projectId;
  const ProjectDetailView({required this.projectId, super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProjectDetailViewModel>(
      viewModel: ProjectDetailViewModel(),
      onModelReady: (model) {
        model.projectId = projectId;
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, ProjectDetailViewModel value) =>
          Scaffold(
        body: Observer(
          builder: (context) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Observer(builder: (context) {
                  if (value.entity == null) {
                    return const SizedBox.shrink();
                  }
                  return switch (
                      value.entity!.detail.template[value.templateIndex].type) {
                    TEMPLATE.TEMPLATE_ONE => FutureTemplateView(
                        key: Key(
                            "${value.entity!.detail.template[value.templateIndex].id}"),
                        projectDetailId: value.entity!.detail.id,
                        projectSettingsId: value
                            .entity!.detail.template[value.templateIndex].id,
                      ),
                    TEMPLATE.TEMPLATE_TWO =>
                      GeneralInformationAndGalleryTemplateView(
                        key: Key(
                            "${value.entity!.detail.template[value.templateIndex].id}"),
                        projectDetailId: value.entity!.detail.id,
                        projectSettingsId: value
                            .entity!.detail.template[value.templateIndex].id,
                      ),
                    TEMPLATE.TEMPLATE_THREE => PossibiltyTemplateView(
                        key: Key(
                            "${value.entity!.detail.template[value.templateIndex].id}"),
                        projectDetailId: value.entity!.detail.id,
                        projectSettingsId: value
                            .entity!.detail.template[value.templateIndex].id,
                      ),
                    TEMPLATE.TEMPLATE_FOUR => FeatureAndGalleryTemplateView(
                        key: Key(
                            "${value.entity!.detail.template[value.templateIndex].id}"),
                        projectDetailId: value.entity!.detail.id,
                        projectSettingsId: value
                            .entity!.detail.template[value.templateIndex].id,
                      ),
                    TEMPLATE.TEMPLATE_FIVE => ShareableMaterialTemplateView(
                        key: Key(
                            "${value.entity!.detail.template[value.templateIndex].id}"),
                      ),
                    TEMPLATE.TEMPLATE_SIX => PlanTemplateView(
                        key: Key(
                            "${value.entity!.detail.template[value.templateIndex].id}"),
                      ),
                    TEMPLATE.TEMPLATE_SEVEN => VirtualTourTemplateView(
                        key: Key(
                            "${value.entity!.detail.template[value.templateIndex].id}"),
                      ),
                  };
                }),
                SafeArea(
                  child: Container(
                    padding: context.largeSpacerOnlyHorizontal,
                    margin: context.smallSpacerOnlyBottom,
                    child: Observer(
                      builder: (context) {
                        if (value.entity == null) {
                          return const SizedBox.shrink();
                        }
                        return Row(
                          children: [
                            value.templateIndex != 0
                                ? GestureDetector(
                                    onTap: () => value
                                        .changeIndex(value.templateIndex - 1),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: context
                                              .toColor(APPLICATION_COLOR.GOLD),
                                          borderRadius: context.midRadius),
                                      child:
                                          const Icon(Icons.keyboard_arrow_left),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            const Spacer(),
                            GestureDetector(
                              onTap: () => value.navigation.pop(),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    color:
                                        context.toColor(APPLICATION_COLOR.GOLD),
                                    borderRadius: context.midRadius),
                                child: const Icon(Icons.home),
                              ),
                            ),
                            Gap(context.midSpacerSize),
                            GestureDetector(
                              onTap: () => value.togglePageSelector(),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    color:
                                        context.toColor(APPLICATION_COLOR.GOLD),
                                    borderRadius: context.midRadius),
                                child: const Icon(Icons.menu),
                              ),
                            ),
                            value.templateIndex !=
                                    value.entity!.detail.template.length - 1
                                ? Gap(context.midSpacerSize)
                                : const SizedBox.shrink(),
                            value.templateIndex !=
                                    value.entity!.detail.template.length - 1
                                ? GestureDetector(
                                    onTap: () => value
                                        .changeIndex(value.templateIndex + 1),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: context
                                              .toColor(APPLICATION_COLOR.GOLD),
                                          borderRadius: context.midRadius),
                                      child: const Icon(
                                          Icons.keyboard_arrow_right),
                                    ),
                                  )
                                : const SizedBox.shrink()
                          ],
                        );
                      },
                    ),
                  ),
                ),
                value.isPageSelectorVisible
                    ? PageSelectorWidget(
                        pages: value.entity!.detail.template
                            .map((e) => e.title)
                            .toList(),
                        selectedIndex: value.templateIndex,
                        newIndex: (newIndex) => value.changeIndex(newIndex),
                      )
                    : const SizedBox.shrink()
              ],
            );
          },
        ),
      ),
    );
  }
}
