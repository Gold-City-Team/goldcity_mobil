import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/view/presentation/project/template/shareable_material/view_model/shareable_material_template_view_model.dart';
import 'package:goldcity/view/presentation/project/template/shareable_material/widget/phone_template_row_widget.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class ShareableMaterialTemplateView extends StatelessWidget {
  final int projectDetailId;
  final int projectSettingsId;
  const ShareableMaterialTemplateView({
    required this.projectDetailId,
    required this.projectSettingsId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseView<ShareableMaterialTemplateViewModel>(
      viewModel: ShareableMaterialTemplateViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.projectDetailId = projectDetailId;
        model.projectSettingsId = projectSettingsId;
        model.init();
      },
      onPageBuilder:
          (BuildContext context, ShareableMaterialTemplateViewModel value) =>
              Scaffold(body: SafeArea(child: telephoneView(context, value))),
    );
  }

  Widget telephoneView(
      BuildContext context, ShareableMaterialTemplateViewModel value) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(context.midSpacerSize),
        Observer(builder: (context) {
          if (value.template == null) {
            return const SizedBox.shrink();
          }
          return Padding(
            padding: context.midSpacerOnlyHorizontal,
            child: LabelText(
              text: value.template!.title,
              fontSize: FONT_SIZE.HEADLINE_LARGE,
            ).animate().fade(),
          );
        }),
        Gap(context.largeSpacerSize),
        Observer(
          builder: (context) {
            if (value.template == null) {
              return const SizedBox.shrink();
            }
            return Column(
              children: value.template!.gallery
                  .map((e) => e.category.translation.title)
                  .toSet()
                  .map(
                    (e) => Padding(
                      padding: context.midSpacerOnlyBottom,
                      child: GestureDetector(
                        onTap: () => value.toggleFullViewItemIndex(e),
                        child: PhoneTemplateRowWidget(
                          isFullView: value.fullViewItemIndex
                              .any((element) => element == e),
                          gallery: value.template!.gallery
                              .where((element) =>
                                  element.category.translation.title == e)
                              .toList(),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          },
        ),
        Gap(context.veryLargeSpacerOnlyBottom.bottom)
      ],
    ));
  }
}
