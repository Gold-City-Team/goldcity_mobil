import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/view/presentation/project/template/shareable_material/view_model/shareable_material_template_view_model.dart';

class ShareableMaterialTemplateView extends StatelessWidget {
  const ShareableMaterialTemplateView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ShareableMaterialTemplateViewModel>(
      viewModel: ShareableMaterialTemplateViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder:
          (BuildContext context, ShareableMaterialTemplateViewModel value) =>
              const Scaffold(),
    );
  }
}
