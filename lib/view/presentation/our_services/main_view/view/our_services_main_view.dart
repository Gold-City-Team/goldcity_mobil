import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/view/presentation/our_services/main_view/view_model/our_services_main_view_model.dart';

class OurServicesMainView extends StatelessWidget {
  const OurServicesMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<OurServicesMainViewModel>(
        viewModel: OurServicesMainViewModel(),
        onModelReady: (model) {
          model.init();
          model.setContext(context);
        },
        onPageBuilder: (BuildContext context, OurServicesMainViewModel value) => Scaffold());
  }
}
