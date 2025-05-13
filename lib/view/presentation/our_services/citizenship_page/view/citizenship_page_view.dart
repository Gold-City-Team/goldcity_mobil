import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/view/presentation/our_services/citizenship_page/view_model/citizenship_page_view_model.dart';

class CitizenshipPageView extends StatelessWidget {
  const CitizenshipPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<CitizenshipPageViewModel>(
        viewModel: CitizenshipPageViewModel(),
        onModelReady: (model) {
          model.init();
          model.setContext(context);
        },
        onPageBuilder: (BuildContext context, CitizenshipPageViewModel value) => Scaffold());
  }
}
