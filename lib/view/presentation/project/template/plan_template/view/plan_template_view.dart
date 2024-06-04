import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/presentation/project/template/plan_template/view_model/plan_template_view_model.dart';
import 'package:goldcity/view/presentation/project/template/plan_template/widget/row_widget.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';

class PlanTemplateView extends StatelessWidget {
  const PlanTemplateView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PlanTemplateViewModel>(
      viewModel: PlanTemplateViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, PlanTemplateViewModel value) =>
          Scaffold(
        body: tabletView(context, value),
      ),
    );
  }

  Widget tabletView(BuildContext context, PlanTemplateViewModel value) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Gap(context.midSpacerSize),
            SizedBox(
              height: ((context.sWidth / 3) - 20) / 1.7777,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return Container(
                    margin: context.midSpacerOnlyHorizontal,
                    width: (context.sWidth / 3) - 20,
                    height: ((context.sWidth / 3) - 20) / 1.7777,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        color: context.toColor(APPLICATION_COLOR.DARK),
                        child: const NormalNetworkImage(
                            fit: BoxFit.cover,
                            source:
                                "https://wallpapers.com/images/hd/4k-architecture-yellow-glass-building-6d7nbmyltxlyxxv8.jpg"),
                      ),
                    ).animate().fade(),
                  );
                }),
              ),
            ),
            Gap(context.largeSpacerSize),
            Observer(builder: (context) {
              return Column(
                children: value
                    .getGallery()
                    .map((e) => e.galleryCategoryEntity.translations.title)
                    .toSet()
                    .map(
                      (e) => Padding(
                        padding: context.midSpacerOnlyBottom,
                        child: GestureDetector(
                          onTap: () => value.toggleFullViewItemIndex(e),
                          child: RowWidget(
                            isFullView: value.fullViewItemIndex
                                .any((element) => element == e),
                            gallery: value
                                .getGallery()
                                .where((element) =>
                                    element.galleryCategoryEntity.translations
                                        .title ==
                                    e)
                                .toList(),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            })
          ],
        ),
      ),
    );
  }
}
