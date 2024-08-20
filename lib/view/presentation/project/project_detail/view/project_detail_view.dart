import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/data/dto/receive/template/main_template_dto.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/util/resources/authentication_source.dart';
import 'package:goldcity/view/presentation/project/project_detail/view_model/project_detail_view_model.dart';
import 'package:goldcity/view/presentation/project/template/project_animated_wellcome_template/view/project_animated_wellcome_template_view.dart';
import 'package:goldcity/view/presentation/project/template/project_campany_template/view/project_campany_template_view.dart';
import 'package:goldcity/view/presentation/project/template/project_feature_and_gallery_template/view/project_feature_and_gallery_template_view.dart';
import 'package:goldcity/view/presentation/project/template/project_feature_template/view/project_feature_template_view.dart';
import 'package:goldcity/view/presentation/project/template/project_gallery_and_info_template/view/project_gallery_and_info_template.dart';
import 'package:goldcity/view/presentation/project/template/plan_template/view/plan_template_view.dart';
import 'package:goldcity/view/presentation/project/template/project_possibilty_template/view/project_possibilty_template_view.dart';
import 'package:goldcity/view/presentation/project/template/project_text_image_template/view/project_text_image_template_view.dart';
import 'package:goldcity/view/presentation/project/template/project_two_main_image_template/view/project_two_main_image_template_view.dart';
import 'package:goldcity/view/presentation/project/template/shareable_material/view/shareable_material_template_view.dart';
import 'package:goldcity/view/presentation/project/template/virtual_tour_template/view/virtual_tour_template_view.dart';
import 'package:goldcity/view/widget/language_item/language_item_widget.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/page_selector/page_selector_widget.dart';
import 'package:goldcity/view/widget/text/label_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ProjectDetailView extends StatefulWidget {
  final dynamic projectId;
  const ProjectDetailView({required this.projectId, super.key});

  @override
  State<ProjectDetailView> createState() => _ProjectDetailViewState();
}

class _ProjectDetailViewState extends State<ProjectDetailView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  ProjectDetailViewModel? modelGlobal;
  @override
  Widget build(BuildContext context) {
    return BaseView<ProjectDetailViewModel>(
      viewModel: ProjectDetailViewModel(),
      onModelReady: (model) {
        model.projectId = widget.projectId ?? 0;
        model.setContext(context);
        model.init();
        modelGlobal = model;
      },
      onPageBuilder: (BuildContext context, ProjectDetailViewModel value) =>
          Scaffold(
              body: SafeArea(
                  child: isTablet()
                      ? tabletView(context, value)
                      : phoneView(context, value))),
    );
  }

  Widget phoneView(BuildContext context, ProjectDetailViewModel value) {
    return Observer(builder: (context) {
      if (value.languageId == 0) {
        return Container(
          alignment: Alignment.center,
          width: context.sWidth,
          height: context.sHeight,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => context.pop(),
                    child: Container(
                      width: 50,
                      margin: context.largeSpacer,
                      height: 50,
                      decoration: BoxDecoration(
                          color: context.toColor(APPLICATION_COLOR.GOLD),
                          borderRadius: context.midRadius),
                      child: const Icon(Icons.close),
                    ),
                  ),
                ),
              ),
              Gap(context.veryLargeSpacerSize),
              Observer(builder: (context) {
                if (value.languageList.isEmpty) {
                  return const SizedBox.shrink();
                }
                return DefaultTextStyle(
                  style: context.toTextStyle(FONT_SIZE.DISPLAY_SMALL).copyWith(
                        color:
                            context.toColor(APPLICATION_COLOR.OPPOSITE_COLOR),
                      ),
                  child: AnimatedTextKit(
                    animatedTexts: value.languageList
                        .map((e) => TyperAnimatedText(e,
                            speed: Duration(milliseconds: 125)))
                        .toList(),
                  ),
                );
              }),
              Gap(context.veryLargeSpacerSize),
              Observer(builder: (context) {
                if (value.language == null) {
                  return const SizedBox.shrink();
                }
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: value.language!.languages.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                              onTap: () {
                                value.languageId =
                                    value.language!.languages[index].id;
                                value.getProjectDetail();
                              },
                              child: Container(
                                margin: context.largeSpacerOnlyRight,
                                height: context.sHeight * .4,
                                child: LanguageItemWidget(
                                    value: value.language!.languages[index]),
                              )),
                        ),
                      );
                    },
                  ),
                );
              }),
              Gap(context.veryLargeSpacerSize),
            ],
          ),
        );
      }
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Observer(builder: (context) {
            if (value.entity == null || value.entity!.detail.template.isEmpty) {
              return const SizedBox.shrink();
            }
            return switch (
                value.entity!.detail.template[value.templateIndex].type) {
              TEMPLATE.PROJECT_TEMPLATE_ONE =>
                ProjectAnimatedWellcomeTemplateView(
                  key: Key(
                      "${value.entity!.detail.template[value.templateIndex].id}"),
                  projectSettingsId:
                      value.entity!.detail.template[value.templateIndex].id,
                ),
              TEMPLATE.PROJECT_TEMPLATE_TWO => value.entity!.detail
                          .template[value.templateIndex].metaData.viewType ==
                      "ONE"
                  ? Padding(
                      padding: isTablet()
                          ? EdgeInsets.zero
                          : EdgeInsets.only(top: 75),
                      child: ProjectTwoMainImageTemplateView(
                        key: Key(
                            "${value.entity!.detail.template[value.templateIndex].id}"),
                        projectSettingsId: value
                            .entity!.detail.template[value.templateIndex].id,
                      ),
                    )
                  : Padding(
                      padding: isTablet()
                          ? EdgeInsets.zero
                          : EdgeInsets.only(top: 75),
                      child: ProjectGalleryAndInfoTemplate(
                        key: Key(
                            "${value.entity!.detail.template[value.templateIndex].id}"),
                        projectSettingsId: value
                            .entity!.detail.template[value.templateIndex].id,
                      ),
                    ),
              TEMPLATE.PROJECT_TEMPLATE_THREE => ProjectPossibiltyTemplateView(
                  key: Key(
                      "${value.entity!.detail.template[value.templateIndex].id}"),
                  projectDetailId: value.entity!.detail.id,
                  projectSettingsId:
                      value.entity!.detail.template[value.templateIndex].id,
                ),
              TEMPLATE.PROJECT_TEMPLATE_FOUR => Padding(
                  padding: EdgeInsets.only(top: 75),
                  child: ProjectFeatureAndGalleryTemplateView(
                    key: Key(
                        "${value.entity!.detail.template[value.templateIndex].id}"),
                    projectSettingsId:
                        value.entity!.detail.template[value.templateIndex].id,
                  ),
                ),
              TEMPLATE.PROJECT_TEMPLATE_FIVE => Padding(
                  padding: EdgeInsets.only(top: 75),
                  child: ShareableMaterialTemplateView(
                    key: Key(
                        "${value.entity!.detail.template[value.templateIndex].id}"),
                    projectSettingsId:
                        value.entity!.detail.template[value.templateIndex].id,
                  ),
                ),
              TEMPLATE.PROJECT_TEMPLATE_SIX => Padding(
                  padding: EdgeInsets.only(top: 75),
                  child: PlanTemplateView(
                    settingsId:
                        value.entity!.detail.template[value.templateIndex].id,
                    key: Key(
                        "${value.entity!.detail.template[value.templateIndex].id}"),
                  ),
                ),
              TEMPLATE.PROJECT_TEMPLATE_SEVEN => VirtualTourTemplateView(
                  key: Key(
                      "${value.entity!.detail.template[value.templateIndex].id}"),
                  projectSettingsId:
                      value.entity!.detail.template[value.templateIndex].id,
                ),
              TEMPLATE.PROJECT_TEMPLATE_EIGHT => ProjectTextImageTemplateView(
                  key: Key(
                      "${value.entity!.detail.template[value.templateIndex].id}"),
                  detailId: value.entity!.detail.id,
                  settingsId:
                      value.entity!.detail.template[value.templateIndex].id,
                ),
              TEMPLATE.PROJECT_TEMPLATE_NINE => ProjectCampanyTemplateView(
                  key: Key(
                      "${value.entity!.detail.template[value.templateIndex].id}"),
                  projectSettingsId:
                      value.entity!.detail.template[value.templateIndex].id,
                ),
              _ => ProjectFeatureTemplateView(
                  key: Key(
                      "${value.entity!.detail.template[value.templateIndex].id}"),
                  projectSettingsId:
                      value.entity!.detail.template[value.templateIndex].id,
                ),
            };
          }),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 50,
              margin: context.midSpacerOnlyTop,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Observer(builder: (context) {
                    if (value.isShared && value.shareData != null) {
                      return Container(
                        height: 50,
                        alignment: Alignment.centerLeft,
                        padding: context.largeSpacerOnlyHorizontal,
                        color: context.toColor(APPLICATION_COLOR.LIGHT),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                              maxWidth: isTablet()
                                  ? context.sWidth / 2
                                  : context.sWidth - 140),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LabelText(
                                text: value.shareData!.creatorUser.name,
                                textColor: APPLICATION_COLOR.DARK,
                                maxLines: 1,
                                textLineHeight: 1,
                                overflow: TextOverflow.ellipsis,
                                fontSize: FONT_SIZE.TITLE_LARGE,
                              ),
                              value.shareData!.creatorUser.company.name != ""
                                  ? LabelText(
                                      text: value
                                          .shareData!.creatorUser.company.name,
                                      textColor: APPLICATION_COLOR.DARK,
                                      fontSize: FONT_SIZE.LABEL_SMALL,
                                      textLineHeight: 1.2,
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                      );
                    } else if (!value.isShared &&
                        !locator<AuthenticationSource>().isUserStillValid() &&
                        value.contactEntity != null) {
                      return Container(
                        height: 50,
                        alignment: Alignment.centerLeft,
                        padding: context.largeSpacerOnlyHorizontal,
                        color: context.toColor(APPLICATION_COLOR.LIGHT),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                              maxWidth: isTablet()
                                  ? context.sWidth / 2
                                  : context.sWidth - 140),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LabelText(
                                text: value.contactEntity!.fullName,
                                textColor: APPLICATION_COLOR.DARK,
                                maxLines: 1,
                                textLineHeight: 1,
                                overflow: TextOverflow.ellipsis,
                                fontSize: FONT_SIZE.TITLE_LARGE,
                              ),
                              LabelText(
                                text: value.contactEntity!.companyName,
                                textColor: APPLICATION_COLOR.DARK,
                                fontSize: FONT_SIZE.LABEL_SMALL,
                                textLineHeight: 1.2,
                              )
                            ],
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  }),
                  Observer(builder: (context) {
                    if (value.isShared) {
                      return SizedBox(
                        height: 50,
                        child: Row(
                          children: [
                            Gap(context.smallSpacerSize),
                            WebViewAware(
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () => {
                                    launchUrl(Uri.parse(
                                        "mailto:${value.shareData!.creatorUser.email}"))
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: context
                                          .toColor(APPLICATION_COLOR.LIGHT),
                                    ),
                                    child: Icon(
                                      Icons.mail,
                                      color: context
                                          .toColor(APPLICATION_COLOR.DARK),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Gap(context.smallSpacerSize),
                            WebViewAware(
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () => {
                                    launchUrl(Uri.parse(
                                        "tel:${value.shareData!.creatorUser.tel}"))
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: context
                                          .toColor(APPLICATION_COLOR.LIGHT),
                                    ),
                                    child: Icon(
                                      Icons.call,
                                      color: context
                                          .toColor(APPLICATION_COLOR.DARK),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (!locator<AuthenticationSource>()
                            .isUserStillValid() &&
                        value.contactEntity != null) {
                      return SizedBox(
                        height: 50,
                        child: Row(
                          children: [
                            Gap(context.smallSpacerSize),
                            WebViewAware(
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () => {
                                    launchUrl(Uri.parse(
                                        "mailto:${value.contactEntity!.email}"))
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: context
                                          .toColor(APPLICATION_COLOR.LIGHT),
                                    ),
                                    child: Icon(
                                      Icons.mail,
                                      color: context
                                          .toColor(APPLICATION_COLOR.DARK),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Gap(context.smallSpacerSize),
                            WebViewAware(
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () => {
                                    launchUrl(Uri.parse(
                                        "tel:${value.contactEntity!.phoneNumber}"))
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: context
                                          .toColor(APPLICATION_COLOR.LIGHT),
                                    ),
                                    child: Icon(
                                      Icons.call,
                                      color: context
                                          .toColor(APPLICATION_COLOR.DARK),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return locator<AuthenticationSource>().isUserStillValid()
                        ? Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: WebViewAware(
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () => value.sharePageDialog(
                                      context.findRenderObject() as RenderBox?),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: context
                                          .toColor(APPLICATION_COLOR.GOLD),
                                    ),
                                    child: const Icon(Icons.link),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink();
                  }),
                ],
              ),
            ),
          ),
          Observer(builder: (context) {
            if (value.entity == null || value.entity!.detail.template.isEmpty) {
              return const SizedBox.shrink();
            }
            return value.entity!.detail.template[value.templateIndex].type ==
                        TEMPLATE.PROJECT_TEMPLATE_SEVEN ||
                    value.entity!.detail.template[value.templateIndex].type ==
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
                                    .toColor(APPLICATION_COLOR.BACKGROUND_COLOR)
                                    .withAlpha(200),
                                context
                                    .toColor(APPLICATION_COLOR.BACKGROUND_COLOR)
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
                    padding: value.entity!.detail.template[value.templateIndex]
                                .type ==
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
                        Gap(context.smallSpacerSize),
                        WebViewAware(
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
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
                        ),
                        Gap(context.midSpacerSize),
                        WebViewAware(
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
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
                        ),
                        Gap(context.midSpacerSize),
                        WebViewAware(
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
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
                                      .withAlpha(
                                          value.templateIndex != 0 ? 255 : 120),
                                ),
                                child: const Icon(Icons.keyboard_arrow_left),
                              ),
                            ),
                          ),
                        ),
                        Gap(context.midSpacerSize),
                        WebViewAware(
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
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
                            key:
                                Key("${DateTime.now().millisecondsSinceEpoch}"))
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
      );
    });
  }

  Widget tabletView(BuildContext context, ProjectDetailViewModel value) {
    return Observer(builder: (context) {
      if (value.languageId == 0) {
        return Container(
          alignment: Alignment.center,
          width: context.sWidth,
          height: context.sHeight,
          child: Stack(
            children: [
              SizedBox(
                height: context.sHeight,
                width: context.sWidth,
                child: Observer(builder: (context) {
                  if (value.language == null) {
                    return const SizedBox.shrink();
                  }
                  return Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Stack(
                            children: [
                              SizedBox(
                                height: context.sHeight,
                                width: context.sWidth,
                                child: NormalNetworkImage(
                                    fit: BoxFit.cover,
                                    source: value.language!.mainImage.url),
                              ),
                              Container(
                                height: context.sHeight,
                                width: context.sWidth / 2,
                                color: context
                                    .toColor(APPLICATION_COLOR.BACKGROUND_COLOR)
                                    .withOpacity(.7),
                              ),
                              Center(
                                child: Padding(
                                  padding: context.xlargeSpacerOnlyHorizontal,
                                  child: NormalNetworkImage(
                                      fit: BoxFit.cover,
                                      source: value.language!.logo.url),
                                ),
                              ),
                            ],
                          )),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: context.xlargeSpacerOnlyLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Observer(builder: (context) {
                                if (value.languageList.isEmpty) {
                                  return const SizedBox.shrink();
                                }
                                return DefaultTextStyle(
                                  style: context
                                      .toTextStyle(FONT_SIZE.DISPLAY_SMALL)
                                      .copyWith(
                                        color: context.toColor(
                                            APPLICATION_COLOR.OPPOSITE_COLOR),
                                      ),
                                  child: AnimatedTextKit(
                                    animatedTexts: value.languageList
                                        .map((e) => TyperAnimatedText(e,
                                            speed: Duration(milliseconds: 125)))
                                        .toList(),
                                  ),
                                );
                              }),
                              Gap(context.veryLargeSpacerSize),
                              SizedBox(
                                height: context.sHeight * .6,
                                width: (context.sWidth / 3) * 2,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: value.language!.languages.length,
                                  itemBuilder: (context, index) {
                                    return MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: SizedBox(
                                        height: context.sHeight,
                                        width: 170,
                                        child: GestureDetector(
                                            onTap: () {
                                              value.languageId = value.language!
                                                  .languages[index].id;
                                              value.getProjectDetail();
                                            },
                                            child: Container(
                                              margin:
                                                  context.largeSpacerOnlyRight,
                                              child: LanguageItemWidget(
                                                  value: value.language!
                                                      .languages[index]),
                                            )),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                }),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => context.pop(),
                  child: Container(
                    width: 50,
                    margin: context.largeSpacer,
                    height: 50,
                    decoration: BoxDecoration(
                        color: context.toColor(APPLICATION_COLOR.GOLD),
                        borderRadius: context.midRadius),
                    child: const Icon(Icons.close),
                  ),
                ),
              ),
            ],
          ),
        );
      }
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Observer(builder: (context) {
            if (value.entity == null || value.entity!.detail.template.isEmpty) {
              return const SizedBox.shrink();
            }
            return switch (
                value.entity!.detail.template[value.templateIndex].type) {
              TEMPLATE.PROJECT_TEMPLATE_ONE =>
                ProjectAnimatedWellcomeTemplateView(
                  key: Key(
                      "${value.entity!.detail.template[value.templateIndex].id}"),
                  projectSettingsId:
                      value.entity!.detail.template[value.templateIndex].id,
                ),
              TEMPLATE.PROJECT_TEMPLATE_TWO => value.entity!.detail
                          .template[value.templateIndex].metaData.viewType ==
                      "ONE"
                  ? Padding(
                      padding: isTablet()
                          ? EdgeInsets.zero
                          : EdgeInsets.only(top: 75),
                      child: ProjectTwoMainImageTemplateView(
                        key: Key(
                            "${value.entity!.detail.template[value.templateIndex].id}"),
                        projectSettingsId: value
                            .entity!.detail.template[value.templateIndex].id,
                      ),
                    )
                  : Padding(
                      padding: isTablet()
                          ? EdgeInsets.zero
                          : EdgeInsets.only(top: 75),
                      child: ProjectGalleryAndInfoTemplate(
                        key: Key(
                            "${value.entity!.detail.template[value.templateIndex].id}"),
                        projectSettingsId: value
                            .entity!.detail.template[value.templateIndex].id,
                      ),
                    ),
              TEMPLATE.PROJECT_TEMPLATE_THREE => ProjectPossibiltyTemplateView(
                  key: Key(
                      "${value.entity!.detail.template[value.templateIndex].id}"),
                  projectDetailId: value.entity!.detail.id,
                  projectSettingsId:
                      value.entity!.detail.template[value.templateIndex].id,
                ),
              TEMPLATE.PROJECT_TEMPLATE_FOUR => Padding(
                  padding: EdgeInsets.only(top: 75),
                  child: ProjectFeatureAndGalleryTemplateView(
                    key: Key(
                        "${value.entity!.detail.template[value.templateIndex].id}"),
                    projectSettingsId:
                        value.entity!.detail.template[value.templateIndex].id,
                  ),
                ),
              TEMPLATE.PROJECT_TEMPLATE_FIVE => Padding(
                  padding: EdgeInsets.only(top: 75),
                  child: ShareableMaterialTemplateView(
                    key: Key(
                        "${value.entity!.detail.template[value.templateIndex].id}"),
                    projectSettingsId:
                        value.entity!.detail.template[value.templateIndex].id,
                  ),
                ),
              TEMPLATE.PROJECT_TEMPLATE_SIX => Padding(
                  padding: EdgeInsets.only(top: 75),
                  child: PlanTemplateView(
                    settingsId:
                        value.entity!.detail.template[value.templateIndex].id,
                    key: Key(
                        "${value.entity!.detail.template[value.templateIndex].id}"),
                  ),
                ),
              TEMPLATE.PROJECT_TEMPLATE_SEVEN => VirtualTourTemplateView(
                  key: Key(
                      "${value.entity!.detail.template[value.templateIndex].id}"),
                  projectSettingsId:
                      value.entity!.detail.template[value.templateIndex].id,
                ),
              TEMPLATE.PROJECT_TEMPLATE_EIGHT => ProjectTextImageTemplateView(
                  key: Key(
                      "${value.entity!.detail.template[value.templateIndex].id}"),
                  detailId: value.entity!.detail.id,
                  settingsId:
                      value.entity!.detail.template[value.templateIndex].id,
                ),
              TEMPLATE.PROJECT_TEMPLATE_NINE => ProjectCampanyTemplateView(
                  key: Key(
                      "${value.entity!.detail.template[value.templateIndex].id}"),
                  projectSettingsId:
                      value.entity!.detail.template[value.templateIndex].id,
                ),
              _ => ProjectFeatureTemplateView(
                  key: Key(
                      "${value.entity!.detail.template[value.templateIndex].id}"),
                  projectSettingsId:
                      value.entity!.detail.template[value.templateIndex].id,
                ),
            };
          }),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 50,
              margin: context.midSpacerOnlyTop,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Observer(builder: (context) {
                    if (value.isShared && value.shareData != null) {
                      return Container(
                        height: 50,
                        alignment: Alignment.centerLeft,
                        padding: context.largeSpacerOnlyHorizontal,
                        color: context.toColor(APPLICATION_COLOR.LIGHT),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                              maxWidth: isTablet()
                                  ? context.sWidth / 2
                                  : context.sWidth - 140),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LabelText(
                                text: value.shareData!.creatorUser.name,
                                textColor: APPLICATION_COLOR.DARK,
                                maxLines: 1,
                                textLineHeight: 1,
                                overflow: TextOverflow.ellipsis,
                                fontSize: FONT_SIZE.TITLE_LARGE,
                              ),
                              value.shareData!.creatorUser.company.name != ""
                                  ? LabelText(
                                      text: value
                                          .shareData!.creatorUser.company.name,
                                      textColor: APPLICATION_COLOR.DARK,
                                      fontSize: FONT_SIZE.LABEL_SMALL,
                                      textLineHeight: 1.2,
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                      );
                    } else if (!value.isShared &&
                        !locator<AuthenticationSource>().isUserStillValid() &&
                        value.contactEntity != null) {
                      return Container(
                        height: 50,
                        alignment: Alignment.centerLeft,
                        padding: context.largeSpacerOnlyHorizontal,
                        color: context.toColor(APPLICATION_COLOR.LIGHT),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                              maxWidth: isTablet()
                                  ? context.sWidth / 2
                                  : context.sWidth - 140),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LabelText(
                                text: value.contactEntity!.fullName,
                                textColor: APPLICATION_COLOR.DARK,
                                maxLines: 1,
                                textLineHeight: 1,
                                overflow: TextOverflow.ellipsis,
                                fontSize: FONT_SIZE.TITLE_LARGE,
                              ),
                              LabelText(
                                text: value.contactEntity!.companyName,
                                textColor: APPLICATION_COLOR.DARK,
                                fontSize: FONT_SIZE.LABEL_SMALL,
                                textLineHeight: 1.2,
                              )
                            ],
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  }),
                  Observer(builder: (context) {
                    if (value.isShared) {
                      return SizedBox(
                        height: 50,
                        child: Row(
                          children: [
                            Gap(context.smallSpacerSize),
                            WebViewAware(
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () => {
                                    launchUrl(Uri.parse(
                                        "mailto:${value.shareData!.creatorUser.email}"))
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: context
                                          .toColor(APPLICATION_COLOR.LIGHT),
                                    ),
                                    child: Icon(
                                      Icons.mail,
                                      color: context
                                          .toColor(APPLICATION_COLOR.DARK),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Gap(context.smallSpacerSize),
                            WebViewAware(
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () => {
                                    launchUrl(Uri.parse(
                                        "tel:${value.shareData!.creatorUser.tel}"))
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: context
                                          .toColor(APPLICATION_COLOR.LIGHT),
                                    ),
                                    child: Icon(
                                      Icons.call,
                                      color: context
                                          .toColor(APPLICATION_COLOR.DARK),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (!locator<AuthenticationSource>()
                            .isUserStillValid() &&
                        value.contactEntity != null) {
                      return SizedBox(
                        height: 50,
                        child: Row(
                          children: [
                            Gap(context.smallSpacerSize),
                            WebViewAware(
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () => {
                                    launchUrl(Uri.parse(
                                        "mailto:${value.contactEntity!.email}"))
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: context
                                          .toColor(APPLICATION_COLOR.LIGHT),
                                    ),
                                    child: Icon(
                                      Icons.mail,
                                      color: context
                                          .toColor(APPLICATION_COLOR.DARK),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Gap(context.smallSpacerSize),
                            WebViewAware(
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () => {
                                    launchUrl(Uri.parse(
                                        "tel:${value.contactEntity!.phoneNumber}"))
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: context
                                          .toColor(APPLICATION_COLOR.LIGHT),
                                    ),
                                    child: Icon(
                                      Icons.call,
                                      color: context
                                          .toColor(APPLICATION_COLOR.DARK),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return locator<AuthenticationSource>().isUserStillValid()
                        ? Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: WebViewAware(
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () => value.sharePageDialog(
                                      context.findRenderObject() as RenderBox?),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: context
                                          .toColor(APPLICATION_COLOR.GOLD),
                                    ),
                                    child: const Icon(Icons.ios_share),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink();
                  }),
                ],
              ),
            ),
          ),
          Observer(builder: (context) {
            if (value.entity == null || value.entity!.detail.template.isEmpty) {
              return const SizedBox.shrink();
            }
            return value.entity!.detail.template[value.templateIndex].type ==
                        TEMPLATE.PROJECT_TEMPLATE_SEVEN ||
                    value.entity!.detail.template[value.templateIndex].type ==
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
                                    .toColor(APPLICATION_COLOR.BACKGROUND_COLOR)
                                    .withAlpha(200),
                                context
                                    .toColor(APPLICATION_COLOR.BACKGROUND_COLOR)
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
                    padding: value.entity!.detail.template[value.templateIndex]
                                .type ==
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
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
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
                        ),
                        Gap(context.midSpacerSize),
                        WebViewAware(
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
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
                        ),
                        Gap(context.midSpacerSize),
                        WebViewAware(
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
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
                                      .withAlpha(
                                          value.templateIndex != 0 ? 255 : 120),
                                ),
                                child: const Icon(Icons.keyboard_arrow_left),
                              ),
                            ),
                          ),
                        ),
                        Gap(context.midSpacerSize),
                        WebViewAware(
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
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
                            key:
                                Key("${DateTime.now().millisecondsSinceEpoch}"))
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
      );
    });
  }
}
