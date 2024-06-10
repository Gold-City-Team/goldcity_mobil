import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/view/presentation/complex/complex_detail/view_model/complex_detail_view_model.dart';

class ComplexDetailView extends StatelessWidget {
  const ComplexDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ComplexDetailViewModel>(
      viewModel: ComplexDetailViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, ComplexDetailViewModel value) =>
          const Scaffold(),
    );
  }
}
