import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/presentation/main/home/view_model/home_view_model.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, HomeViewModel value) => Scaffold(
          body: SafeArea(
        top: true,
        bottom: false,
        left: true,
        right: true,
        minimum: context.largeSpacerOnlyTop,
        child: Observer(builder: (context) {
          if (value.projectList == null) {
            return const SizedBox.shrink();
          }
          return Wrap(
            children: value.projectList!
                .map((e) => GestureDetector(
                      onTap: () => value.navigateProjectDetail(e.id),
                      child: Container(
                        margin: context.midSpacer,
                        color: context.toColor(
                            APPLICATION_COLOR.EXTRA_CLOSE_BACKGROUND_COLOR),
                        padding: context.largeSpacer,
                        child: Column(
                          children: [
                            LabelText(text: e.detail.title),
                            Gap(context.midSpacerSize),
                            LabelText(text: e.detail.slogan),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          );
        }),
      )),
    );
  }
}
