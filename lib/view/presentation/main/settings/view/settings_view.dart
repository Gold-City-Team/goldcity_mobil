import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/view/presentation/main/settings/view_model/settings_view_model.dart';
import 'package:goldcity/view/widget/button/normal_button.dart';
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
          top: true,
          bottom: false,
          left: true,
          right: true,
          minimum: context.largeSpacerOnlyTop,
          child: ListView.builder(
            padding: context.largeSpacerOnlyTop,
            itemCount: value.menuItems.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin: context.largeSpacerOnlyHorizontal,
                    child: Row(
                      children: [
                        LabelText(
                          text: value.menuItems[index],
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 100,
                          child: NormalButton(
                            onTap: () => value.doAction(index),
                            text: "Değiştir",
                          ),
                        )
                      ],
                    ),
                  ),
                  Gap(context.midSpacerSize)
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
