import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/data/dto/receive/template/main_template_dto.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/presentation/project/project_detail/view_model/project_detail_view_model.dart';
import 'package:goldcity/view/presentation/project/template/project_animated_wellcome_template/view/project_animated_wellcome_template_view.dart';
import 'package:goldcity/view/presentation/project/template/project_feature_and_gallery_template/view/project_feature_and_gallery_template_view.dart';
import 'package:goldcity/view/presentation/project/template/project_feature_template/view/project_feature_template_view.dart';
import 'package:goldcity/view/presentation/project/template/project_gallery_and_info_template/view/project_gallery_and_info_template.dart';
import 'package:goldcity/view/presentation/project/template/plan_template/view/plan_template_view.dart';
import 'package:goldcity/view/presentation/project/template/project_possibilty_template/view/project_possibilty_template_view.dart';
import 'package:goldcity/view/presentation/project/template/project_text_image_template/view/project_text_image_template_view.dart';
import 'package:goldcity/view/presentation/project/template/project_two_main_image_template/view/project_two_main_image_template_view.dart';
import 'package:goldcity/view/presentation/project/template/shareable_material/view/shareable_material_template_view.dart';
import 'package:goldcity/view/presentation/project/template/virtual_tour_template/view/virtual_tour_template_view.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/page_selector/page_selector_widget.dart';
import 'package:goldcity/view/widget/text/label_text.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ProjectDetailView extends StatefulWidget {
  final int projectId;
  const ProjectDetailView({required this.projectId, super.key});

  @override
  State<ProjectDetailView> createState() => _ProjectDetailViewState();
}

class _ProjectDetailViewState extends State<ProjectDetailView> {
  final FocusNode _focusNode = FocusNode();
// The message to display.

// Focus nodes need to be disposed.
  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (modelGlobal != null && event.runtimeType == KeyUpEvent) {
      if (event.physicalKey == PhysicalKeyboardKey.arrowLeft) {
        modelGlobal!.templateIndex != 0
            ? modelGlobal!.changeIndex(modelGlobal!.templateIndex - 1)
            : null;
      } else if (event.physicalKey == PhysicalKeyboardKey.arrowRight) {
        modelGlobal!.templateIndex !=
                modelGlobal!.entity!.detail.template.length - 1
            ? modelGlobal!.changeIndex(modelGlobal!.templateIndex + 1)
            : null;
      }
    }
    return KeyEventResult.handled;
  }

  ProjectDetailViewModel? modelGlobal;
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(_focusNode);

    return BaseView<ProjectDetailViewModel>(
      viewModel: ProjectDetailViewModel(),
      onModelReady: (model) {
        model.projectId = widget.projectId;
        model.setContext(context);
        model.init();
        modelGlobal = model;
      },
      onPageBuilder: (BuildContext context, ProjectDetailViewModel value) =>
          Scaffold(body: Observer(builder: (context) {
        if (value.languageId == 0) {
          return Container(
            alignment: Alignment.center,
            width: context.sWidth,
            height: context.sHeight,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: value.language.length,
              itemBuilder: (context, index) {
                return Center(
                    child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: context.sWidth / 10, minWidth: 150),
                  child: Container(
                      padding: context.largeSpacerOnlyVertical,
                      alignment: Alignment.center,
                      margin: context.midSpacer,
                      color: context.toColor(
                          APPLICATION_COLOR.EXTRA_CLOSE_BACKGROUND_COLOR),
                      child: LabelText(text: value.language[index].name)),
                ));
              },
            ),
          );
        }
        return Focus(
          focusNode: _focusNode,
          onKeyEvent: _handleKeyEvent,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Observer(builder: (context) {
                if (value.entity == null ||
                    value.entity!.detail.template.isEmpty) {
                  return const SizedBox.shrink();
                }
                return switch (
                    value.entity!.detail.template[value.templateIndex].type) {
                  TEMPLATE.PROJECT_TEMPLATE_ONE =>
                    ProjectAnimatedWellcomeTemplateView(
                      key: Key(
                          "${value.entity!.detail.template[value.templateIndex].id}"),
                      projectDetailId: value.entity!.detail.id,
                      projectSettingsId:
                          value.entity!.detail.template[value.templateIndex].id,
                    ),
                  TEMPLATE.PROJECT_TEMPLATE_TWO => value
                              .entity!
                              .detail
                              .template[value.templateIndex]
                              .metaData
                              .viewType ==
                          "ONE"
                      ? ProjectTwoMainImageTemplateView(
                          key: Key(
                              "${value.entity!.detail.template[value.templateIndex].id}"),
                          projectDetailId: value.entity!.detail.id,
                          projectSettingsId: value
                              .entity!.detail.template[value.templateIndex].id,
                        )
                      : ProjectGalleryAndInfoTemplate(
                          key: Key(
                              "${value.entity!.detail.template[value.templateIndex].id}"),
                          projectDetailId: value.entity!.detail.id,
                          projectSettingsId: value
                              .entity!.detail.template[value.templateIndex].id,
                        ),
                  TEMPLATE.PROJECT_TEMPLATE_THREE =>
                    ProjectPossibiltyTemplateView(
                      key: Key(
                          "${value.entity!.detail.template[value.templateIndex].id}"),
                      projectDetailId: value.entity!.detail.id,
                      projectSettingsId:
                          value.entity!.detail.template[value.templateIndex].id,
                    ),
                  TEMPLATE.PROJECT_TEMPLATE_FOUR =>
                    ProjectFeatureAndGalleryTemplateView(
                      key: Key(
                          "${value.entity!.detail.template[value.templateIndex].id}"),
                      projectDetailId: value.entity!.detail.id,
                      projectSettingsId:
                          value.entity!.detail.template[value.templateIndex].id,
                    ),
                  TEMPLATE.PROJECT_TEMPLATE_FIVE =>
                    ShareableMaterialTemplateView(
                      key: Key(
                          "${value.entity!.detail.template[value.templateIndex].id}"),
                      projectDetailId: value.entity!.detail.id,
                      projectSettingsId:
                          value.entity!.detail.template[value.templateIndex].id,
                    ),
                  TEMPLATE.PROJECT_TEMPLATE_SIX => PlanTemplateView(
                      key: Key(
                          "${value.entity!.detail.template[value.templateIndex].id}"),
                    ),
                  TEMPLATE.PROJECT_TEMPLATE_SEVEN => VirtualTourTemplateView(
                      key: Key(
                          "${value.entity!.detail.template[value.templateIndex].id}"),
                      projectDetailId: value.entity!.detail.id,
                      projectSettingsId:
                          value.entity!.detail.template[value.templateIndex].id,
                    ),
                  TEMPLATE.PROJECT_TEMPLATE_EIGHT =>
                    ProjectTextImageTemplateView(
                      key: Key(
                          "${value.entity!.detail.template[value.templateIndex].id}"),
                      detailId: value.entity!.detail.id,
                      settingsId:
                          value.entity!.detail.template[value.templateIndex].id,
                    ),
                  _ => ProjectFeatureTemplateView(
                      key: Key(
                          "${value.entity!.detail.template[value.templateIndex].id}"),
                      projectDetailId: value.entity!.detail.id,
                      projectSettingsId:
                          value.entity!.detail.template[value.templateIndex].id,
                    ),
                };
              }),
              Observer(builder: (context) {
                if (value.entity == null ||
                    value.entity!.detail.template.isEmpty) {
                  return const SizedBox.shrink();
                }
                return value.entity!.detail.template[value.templateIndex]
                                .type ==
                            TEMPLATE.PROJECT_TEMPLATE_SEVEN ||
                        value.entity!.detail.template[value.templateIndex]
                                .type ==
                            TEMPLATE.PROJECT_TEMPLATE_THREE
                    ? const SizedBox.shrink()
                    : Positioned(
                        bottom: 0,
                        child: SizedBox(
                          width: context.sWidth,
                          height: 150,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    context.toColor(
                                        APPLICATION_COLOR.BACKGROUND_COLOR),
                                    context
                                        .toColor(
                                            APPLICATION_COLOR.BACKGROUND_COLOR)
                                        .withAlpha(200),
                                    context
                                        .toColor(
                                            APPLICATION_COLOR.BACKGROUND_COLOR)
                                        .withAlpha(0),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
              }),
              SafeArea(
                child: Container(
                  padding: context.largeSpacerOnlyHorizontal,
                  margin: context.smallSpacerOnlyBottom,
                  child: Observer(
                    builder: (context) {
                      if (value.entity == null ||
                          value.entity!.detail.template.isEmpty) {
                        return const SizedBox.shrink();
                      }
                      return Padding(
                        padding: value.entity!.detail
                                    .template[value.templateIndex].type ==
                                TEMPLATE.PROJECT_TEMPLATE_SEVEN
                            ? context.xLargeSpacerOnlyBottom
                            : EdgeInsets.zero,
                        child: Row(
                          children: [
                            const Spacer(),
                            SizedBox(
                              width: 100,
                              height: 50,
                              child: NormalNetworkImage(
                                fit: BoxFit.contain,
                                source: value.entity!.logo.url,
                              ),
                            ),
                            Gap(context.midSpacerSize),
                            WebViewAware(
                              child: GestureDetector(
                                onTap: () => context.pop(),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color:
                                        context.toColor(APPLICATION_COLOR.GOLD),
                                  ),
                                  child: const Icon(Icons.home),
                                ),
                              ),
                            ),
                            Gap(context.midSpacerSize),
                            WebViewAware(
                              child: GestureDetector(
                                onTap: () => value.togglePageSelector(),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color:
                                        context.toColor(APPLICATION_COLOR.GOLD),
                                  ),
                                  child: const Icon(Icons.menu),
                                ),
                              ),
                            ),
                            Gap(context.midSpacerSize),
                            WebViewAware(
                              child: GestureDetector(
                                onTap: () => value.templateIndex != 0
                                    ? value.changeIndex(value.templateIndex - 1)
                                    : null,
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: context
                                        .toColor(APPLICATION_COLOR.GOLD)
                                        .withAlpha(value.templateIndex != 0
                                            ? 255
                                            : 120),
                                  ),
                                  child: const Icon(Icons.keyboard_arrow_left),
                                ),
                              ),
                            ),
                            Gap(context.midSpacerSize),
                            WebViewAware(
                              child: GestureDetector(
                                onTap: () => value.templateIndex !=
                                        value.entity!.detail.template.length - 1
                                    ? value.changeIndex(value.templateIndex + 1)
                                    : null,
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: context
                                        .toColor(APPLICATION_COLOR.GOLD)
                                        .withAlpha(value.templateIndex !=
                                                value.entity!.detail.template
                                                        .length -
                                                    1
                                            ? 255
                                            : 120),
                                  ),
                                  child: const Icon(Icons.keyboard_arrow_right),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Observer(builder: (context) {
                if (value.entity == null) {
                  return const SizedBox.shrink();
                }
                return !value.isPageSelectorLock
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: PageSelectorWidget(
                          pages: value.entity!.detail.template
                              .map((e) => e.title)
                              .toList(),
                          selectedIndex: value.templateIndex,
                          newIndex: (newIndex) => value.changeIndex(newIndex),
                        )
                            .animate(
                                onComplete: (controller) =>
                                    value.isPageSelectorVisible == false
                                        ? value.isPageSelectorLock = true
                                        : null,
                                key: Key(
                                    "${DateTime.now().millisecondsSinceEpoch}"))
                            .slideX(
                              begin: value.isPageSelectorVisible ? 1 : 0,
                              end: value.isPageSelectorVisible ? 0 : 1,
                              curve: Curves.easeOutCubic,
                              duration: Duration(milliseconds: 600),
                            ),
                      )
                    : const SizedBox.shrink();
              })
            ],
          ),
        );
      })),
    );
  }
}
