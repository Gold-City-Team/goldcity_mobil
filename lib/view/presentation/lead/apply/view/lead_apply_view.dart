import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/view/presentation/lead/apply/view_model/lead_apply_view_model.dart';

class LeadApplyView extends StatelessWidget {
  const LeadApplyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<LeadApplyViewModel>(
      viewModel: LeadApplyViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, LeadApplyViewModel value) =>
          const Scaffold(),
    );
  }
}
