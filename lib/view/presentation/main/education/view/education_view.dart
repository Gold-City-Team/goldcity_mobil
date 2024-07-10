import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
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
        model.init();
      },
      onPageBuilder: (BuildContext context, EducationViewModel value) =>
          Scaffold(body: isTablet() ? tabletView(context, value) : Container()),
    );
  }

  Widget tabletView(BuildContext context, EducationViewModel value) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: context.largeSpacerOnlyHorizontal,
          child: SizedBox(
            width: context.sWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(context.midSpacerSize),
                GestureDetector(
                  onTap: () => context.pop(),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: context.toColor(APPLICATION_COLOR.GOLD),
                        borderRadius: context.midRadius),
                    child: const Icon(Icons.keyboard_arrow_left),
                  ),
                ),
                Gap(context.midSpacerSize),
                Observer(
                  builder: (context) {
                    if (value.entity == null) {
                      return const SizedBox.shrink();
                    }
                    return Container(
                      alignment: Alignment.topLeft,
                      width: context.sWidth,
                      child: Wrap(
                        runSpacing: 10,
                        spacing: 10,
                        children: value.entity!
                            .map((e) => SizedBox(
                                width: isTablet()
                                    ? context.sWidth / 3 - 20
                                    : context.sWidth,
                                height: isTablet() ? 550 : 450,
                                child: GestureDetector(
                                    onTap: () => null,
                                    child: EducationRowWidget(entity: e))))
                            .toList(),
                      ),
                    );
                  },
                ),
                Gap(context.midSpacerSize)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
