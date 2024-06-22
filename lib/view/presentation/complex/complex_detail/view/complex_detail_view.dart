import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/data/dto/receive/template/main_template_dto.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/presentation/complex/complex_detail/view_model/complex_detail_view_model.dart';
import 'package:goldcity/view/presentation/complex/template/complex_feature_and_gallery_template/view/complex_feature_and_gallery_template_view.dart';
import 'package:goldcity/view/presentation/complex/template/complex_feature_template/view/complex_feature_template_view.dart';
import 'package:goldcity/view/presentation/complex/template/complex_general_information_and_gallery_template/view/complex_general_information_and_gallery_template_view.dart';
import 'package:goldcity/view/presentation/complex/template/complex_possibilty_template/view/complex_possibilty_template_view.dart';
import 'package:goldcity/view/widget/page_selector/page_selector_widget.dart';

class ComplexDetailView extends StatelessWidget {
  const ComplexDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<ComplexDetailViewModel>(
      viewModel: ComplexDetailViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, ComplexDetailViewModel value) =>
          Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Observer(builder: (context) {
              if (value.entity == null) {
                return const SizedBox.shrink();
              }
              return switch (value
                  .entity!.complexDetail.templates[value.templateIndex].type) {
                TEMPLATE.COMPLEX_TEMPLATE_ONE => ComplexFeatureTemplateView(
                    key: Key(
                        "${value.entity!.complexDetail.templates[value.templateIndex].id}"),
                    complexDetailId: value.entity!.complexDetail.id,
                    complexSettingsId: value.entity!.complexDetail
                        .templates[value.templateIndex].id,
                  ),
                TEMPLATE.COMPLEX_TEMPLATE_TWO =>
                  ComplexGeneralInformationAndGalleryTemplateView(
                    key: Key("${value.entity!.complexDetail.id}"),
                    complexDetailId: value.entity!.complexDetail.id,
                    complexSettingsId: value.entity!.complexDetail
                        .templates[value.templateIndex].id,
                  ),
                TEMPLATE.COMPLEX_TEMPLATE_THREE =>
                  ComplexPossibiltyTemplateView(
                    key: Key("${value.entity!.complexDetail.id}"),
                    projectDetailId: value.entity!.complexDetail.id,
                    projectSettingsId: value.entity!.complexDetail
                        .templates[value.templateIndex].id,
                  ),
                TEMPLATE.COMPLEX_TEMPLATE_FOUR =>
                  ComplexFeatureAndGalleryTemplateView(
                    key: Key("${value.entity!.complexDetail.id}"),
                    detailId: value.entity!.complexDetail.id,
                    settingsId: value.entity!.complexDetail
                        .templates[value.templateIndex].id,
                  ),
                _ => ComplexFeatureTemplateView(
                    key: Key(
                        "${value.entity!.complexDetail.templates[value.templateIndex].id}"),
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
                    return Observer(builder: (context) {
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
                                  value.entity!.complexDetail.templates.length -
                                      1
                              ? Gap(context.midSpacerSize)
                              : const SizedBox.shrink(),
                          value.templateIndex !=
                                  value.entity!.complexDetail.templates.length -
                                      1
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
                                    child:
                                        const Icon(Icons.keyboard_arrow_right),
                                  ),
                                )
                              : const SizedBox.shrink()
                        ],
                      );
                    });
                  },
                ),
              ),
            ),
            Observer(builder: (context) {
              return value.isPageSelectorVisible
                  ? PageSelectorWidget(
                      pages: value.entity!.complexDetail.templates
                          .map((e) => e.title)
                          .toList(),
                      selectedIndex: value.templateIndex,
                      newIndex: (newIndex) => value.changeIndex(newIndex),
                    )
                  : const SizedBox.shrink();
            })
          ],
        ),
      ),
    );
  }
}
