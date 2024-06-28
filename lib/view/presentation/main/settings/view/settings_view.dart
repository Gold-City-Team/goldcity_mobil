import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/presentation/main/settings/view_model/settings_view_model.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsViewModel>(
      viewModel: SettingsViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, SettingsViewModel value) =>
          Scaffold(
        body: SafeArea(
            child: isTablet() ? tabletView(context, value) : isPhoneView()),
      ),
    );
  }

  Widget tabletView(BuildContext context, SettingsViewModel value) {
    return SingleChildScrollView(
      child: SizedBox(
        width: context.sWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(context.midSpacerSize),
            GestureDetector(
              onTap: () => value.navigation.pop(),
              child: Container(
                width: 50,
                margin: context.largeSpacerOnlyHorizontal,
                height: 50,
                decoration: BoxDecoration(
                    color: context.toColor(APPLICATION_COLOR.GOLD),
                    borderRadius: context.midRadius),
                child: const Icon(Icons.keyboard_arrow_left),
              ),
            ),
            Gap(context.largeSpacerSize),
            Observer(builder: (context) {
              return Padding(
                padding: context.largeSpacerOnlyHorizontal,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  children: value.menuItems
                      .map(
                        (e) => GestureDetector(
                          onTap: () => value.showBox(e),
                          child: Container(
                            width: context.sWidth / 2 - 25,
                            height: 100,
                            color: context.toColor(
                                APPLICATION_COLOR.EXTRA_CLOSE_BACKGROUND_COLOR),
                            child: Padding(
                              padding: context.midSpacerOnlyHorizontal,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.description,
                                        color: context
                                            .toColor(APPLICATION_COLOR.GOLD),
                                      ),
                                      Gap(context.midSpacerSize),
                                      LabelText(text: e),
                                    ],
                                  ),
                                  Gap(context.midSpacerSize),
                                  LabelText(
                                    text: e,
                                    textColor: APPLICATION_COLOR.SUBTITLE,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget isPhoneView() {
    return Container();
  }
}
