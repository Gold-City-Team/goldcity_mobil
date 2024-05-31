import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/view/presentation/project/template/feature_and_gallery_template/view_model/feature_and_gallery_template_view_model.dart';

class FeatureAndGalleryTemplateView extends StatelessWidget {
  const FeatureAndGalleryTemplateView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<FeatureAndGalleryTemplateViewModel>(
      viewModel: FeatureAndGalleryTemplateViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder:
          (BuildContext context, FeatureAndGalleryTemplateViewModel value) =>
              const Scaffold(),
    );
  }
}
