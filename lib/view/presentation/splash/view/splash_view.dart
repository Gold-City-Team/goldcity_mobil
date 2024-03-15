import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/config/language/locale_keys.g.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/view/presentation/splash/view_model/splash_view_model.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, SplashViewModel value) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LabelText(
                text: LocaleKeys.companyName.tr(),
                textColor: APPLICATION_COLOR.GOLD,
                fontSize: FONT_SIZE.DISPLAY_LARGE,
              ),
              LabelText(text: LocaleKeys.slogan.tr())
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => value.navigateStory(),
            ),
            Gap(context.midSpacerSize),
            FloatingActionButton(
              onPressed: () => value.navigateProjectDetail(),
            ),
          ],
        ),
      ),
    );
  }
}
