import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/view/presentation/project/template/shareable_material/view_model/shareable_material_template_view_model.dart';
import 'package:goldcity/view/presentation/project/template/shareable_material/widget/phone_template_row_widget.dart';

class ShareableMaterialTemplateView extends StatelessWidget {
  const ShareableMaterialTemplateView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ShareableMaterialTemplateViewModel>(
      viewModel: ShareableMaterialTemplateViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder:
          (BuildContext context, ShareableMaterialTemplateViewModel value) =>
              Scaffold(body: SafeArea(child: telephoneView(value))),
    );
  }

  Widget telephoneView(ShareableMaterialTemplateViewModel value) {
    return SingleChildScrollView(child: Observer(builder: (context) {
      if (value.template == null) {
        return const SizedBox.shrink();
      }
      return Column(
          children: value.template!.gallery
              .map((e) => e.galleryCategoryEntity.translations.title)
              .toSet()
              .map((e) => Padding(
                    padding: context.midSpacerOnlyBottom,
                    child: GestureDetector(
                      onTap: () => value.share(
                          e, context.findRenderObject() as RenderBox?),
                      child: PhoneTemplateRowWidget(
                        categoryName: e,
                        categoryItemCount: value.template!.gallery
                            .where((element) =>
                                element
                                    .galleryCategoryEntity.translations.title ==
                                e)
                            .length,
                      ),
                    ),
                  ))
              .toList());
    }));
  }
}
