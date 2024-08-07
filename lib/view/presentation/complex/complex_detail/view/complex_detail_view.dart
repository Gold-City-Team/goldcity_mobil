import 'package:animated_text_kit/animated_text_kit.dart';
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
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/presentation/complex/complex_detail/view_model/complex_detail_view_model.dart';
import 'package:goldcity/view/presentation/complex/template/complex_double_gallery_template/view/complex_double_gallery_template_template_view.dart';
import 'package:goldcity/view/presentation/complex/template/complex_feature_and_gallery_template/view/complex_feature_and_gallery_template_view.dart';
import 'package:goldcity/view/presentation/complex/template/complex_feature_template/view/complex_feature_template_view.dart';
import 'package:goldcity/view/presentation/complex/template/complex_general_information_and_gallery_template/view/complex_general_information_and_gallery_template_view.dart';
import 'package:goldcity/view/presentation/complex/template/complex_possibilty_template/view/complex_possibilty_template_view.dart';
import 'package:goldcity/view/presentation/webinar_detail/language_item/language_item_widget.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
import 'package:goldcity/view/widget/page_selector/page_selector_widget.dart';

class ComplexDetailView extends StatefulWidget {
  final int complexId;

  const ComplexDetailView({required this.complexId, super.key});

  @override
  State<ComplexDetailView> createState() => _ComplexDetailViewState();
}

class _ComplexDetailViewState extends State<ComplexDetailView> {
  final FocusNode _focusNode = FocusNode();
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
                modelGlobal!.entity!.complexDetail.templates.length - 1
            ? modelGlobal!.changeIndex(modelGlobal!.templateIndex + 1)
            : null;
      }
    }
    return KeyEventResult.handled;
  }

  ComplexDetailViewModel? modelGlobal;

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(_focusNode);
    return BaseView<ComplexDetailViewModel>(
      viewModel: ComplexDetailViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.complexId = widget.complexId;
        model.init();
        modelGlobal = model;
      },
      onPageBuilder: (BuildContext context, ComplexDetailViewModel value) =>
          Scaffold(
        body: Observer(builder: (context) {
          if (value.languageId == 0) {
            return isTablet()
                ? tabletLanguageSelector(context, value)
                : phoneLanguageSelector(context, value);
          }
          return Focus(
            focusNode: _focusNode,
            onKeyEvent: _handleKeyEvent,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Observer(builder: (context) {
                  if (value.entity == null) {
                    return const SizedBox.shrink();
                  }
                  return switch (value.entity!.complexDetail
                      .templates[value.templateIndex].type) {
                    TEMPLATE.COMPLEX_TEMPLATE_ONE => ComplexFeatureTemplateView(
                        key: Key("${value.templateIndex}"),
                        complexDetailId: value.entity!.complexDetail.id,
                        complexSettingsId: value.entity!.complexDetail
                            .templates[value.templateIndex].id,
                      ),
                    TEMPLATE.COMPLEX_TEMPLATE_TWO =>
                      ComplexGeneralInformationAndGalleryTemplateView(
                        key: Key("${value.templateIndex}"),
                        complexDetailId: value.entity!.complexDetail.id,
                        complexSettingsId: value.entity!.complexDetail
                            .templates[value.templateIndex].id,
                      ),
                    TEMPLATE.COMPLEX_TEMPLATE_THREE =>
                      ComplexPossibiltyTemplateView(
                        key: Key("${value.templateIndex}"),
                        detailId: value.entity!.complexDetail.id,
                        settingsId: value.entity!.complexDetail
                            .templates[value.templateIndex].id,
                      ),
                    TEMPLATE.COMPLEX_TEMPLATE_FOUR =>
                      ComplexFeatureAndGalleryTemplateView(
                        key: Key("${value.templateIndex}"),
                        detailId: value.entity!.complexDetail.id,
                        settingsId: value.entity!.complexDetail
                            .templates[value.templateIndex].id,
                      ),
                    TEMPLATE.COMPLEX_TEMPLATE_SEVEN =>
                      ComplexDoubleGalleryTemplateView(
                        key: Key("${value.templateIndex}"),
                        detailId: value.entity!.complexDetail.id,
                        settingsId: value.entity!.complexDetail
                            .templates[value.templateIndex].id,
                      ),
                    _ => ComplexFeatureTemplateView(
                        key: Key("${value.templateIndex}"),
                        complexDetailId: value.entity!.complexDetail.id,
                        complexSettingsId: value.entity!.complexDetail
                            .templates[value.templateIndex].id,
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
                        return Padding(
                          padding: value.entity!.complexDetail
                                      .templates[value.templateIndex].type ==
                                  TEMPLATE.PROJECT_TEMPLATE_SEVEN
                              ? context.xLargeSpacerOnlyBottom
                              : EdgeInsets.zero,
                          child: Row(
                            children: [
                              const Spacer(),
                              Gap(context.midSpacerSize),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () => context.pop(),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: context
                                          .toColor(APPLICATION_COLOR.GOLD),
                                    ),
                                    child: const Icon(Icons.home),
                                  ),
                                ),
                              ),
                              Gap(context.midSpacerSize),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () => value.togglePageSelector(),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: context
                                          .toColor(APPLICATION_COLOR.GOLD),
                                    ),
                                    child: const Icon(Icons.menu),
                                  ),
                                ),
                              ),
                              Gap(context.midSpacerSize),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () => value.templateIndex != 0
                                      ? value
                                          .changeIndex(value.templateIndex - 1)
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
                                    child:
                                        const Icon(Icons.keyboard_arrow_left),
                                  ),
                                ),
                              ),
                              Gap(context.midSpacerSize),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () => value.templateIndex !=
                                          value.entity!.complexDetail.templates
                                                  .length -
                                              1
                                      ? value
                                          .changeIndex(value.templateIndex + 1)
                                      : null,
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: context
                                          .toColor(APPLICATION_COLOR.GOLD)
                                          .withAlpha(value.templateIndex !=
                                                  value.entity!.complexDetail
                                                          .templates.length -
                                                      1
                                              ? 255
                                              : 120),
                                    ),
                                    child:
                                        const Icon(Icons.keyboard_arrow_right),
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
                            pages: value.entity!.complexDetail.templates
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
        }),
      ),
    );
  }

  Widget phoneLanguageSelector(
      BuildContext context, ComplexDetailViewModel value) {
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
                    color: context.toColor(APPLICATION_COLOR.OPPOSITE_COLOR),
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
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: value.language.length,
              itemBuilder: (context, index) {
                return Center(
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                        onTap: () {
                          value.languageId = value.language[index].id;
                          value.getComplexDetail();
                        },
                        child: Container(
                          margin: context.largeSpacerOnlyRight,
                          height: context.sHeight * .4,
                          child:
                              LanguageItemWidget(value: value.language[index]),
                        )),
                  ),
                );
              },
            ),
          ),
          Gap(context.veryLargeSpacerSize),
        ],
      ),
    );
  }

  Widget tabletLanguageSelector(
      BuildContext context, ComplexDetailViewModel value) {
    return Container(
      alignment: Alignment.center,
      width: context.sWidth,
      height: context.sHeight,
      child: Stack(
        children: [
          SizedBox(
            height: context.sHeight,
            width: context.sWidth,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: context.sHeight,
                          width: context.sWidth / 2,
                          child: NormalNetworkImage(
                              fit: BoxFit.cover,
                              source:
                                  "https://parametric-architecture.com/wp-content/uploads/2023/05/Tim-Fu-AI-3.jpg"),
                        ),
                        Center(
                          child: Padding(
                            padding: context.xlargeSpacerOnlyHorizontal,
                            child: NormalNetworkImage(
                                fit: BoxFit.cover,
                                source:
                                    "https://parametric-architecture.com/wp-content/uploads/2023/05/Tim-Fu-AI-3.jpg"),
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
                            itemCount: value.language.length,
                            itemBuilder: (context, index) {
                              return MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: SizedBox(
                                  height: context.sHeight,
                                  width: 170,
                                  child: GestureDetector(
                                      onTap: () {
                                        value.languageId =
                                            value.language[index].id;
                                        value.getComplexDetail();
                                      },
                                      child: Container(
                                        margin: context.largeSpacerOnlyRight,
                                        child: LanguageItemWidget(
                                            value: value.language[index]),
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
            ),
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
}
