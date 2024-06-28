import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/view/presentation/main/education/view_model/education_view_model.dart';
import 'package:goldcity/view/presentation/main/education/widget/education_row_widget.dart';

class EducationView extends StatelessWidget {
  const EducationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<EducationViewModel>(
      viewModel: EducationViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, EducationViewModel value) =>
          Scaffold(
        body: SafeArea(
            child: Container(
          alignment: Alignment.topCenter,
          width: context.sWidth,
          child: Wrap(
            spacing: 10,
            children: [1, 1, 1]
                .map((e) => SizedBox(
                    width: context.sWidth / 3 - 10,
                    child: EducationRowWidget(onTap: () => null)))
                .toList(),
          ),
        )),
      ),
    );
  }
}
