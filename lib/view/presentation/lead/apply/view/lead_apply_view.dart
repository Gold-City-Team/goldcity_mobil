import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/view/presentation/lead/apply/view_model/lead_apply_view_model.dart';
import 'package:goldcity/view/widget/text_field/rounded_text_field.dart';

class LeadApplyView extends StatelessWidget {
  const LeadApplyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<LeadApplyViewModel>(
      viewModel: LeadApplyViewModel(),
      onModelReady: (model) {
        model.init();
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, LeadApplyViewModel value) =>
          Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => value.apply(),
        ),
        body: SafeArea(
          child: Padding(
            padding: context.midSpacerOnlyHorizontal,
            child: Column(
              children: [
                RoundedTextField(newText: (newText) => null),
                RoundedTextField(newText: (newText) => null),
                RoundedTextField(newText: (newText) => null),
                RoundedTextField(newText: (newText) => null),
                RoundedTextField(newText: (newText) => null),
                RoundedTextField(newText: (newText) => null),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
