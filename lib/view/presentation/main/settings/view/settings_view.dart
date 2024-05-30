import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/config/language/locale_keys.g.dart';
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
        body: Column(
          children: [
            Container(
              margin: context.largeSpacerOnlyHorizontal,
              child: Row(
                children: [
                  LabelText(
                    text: LocaleKeys.darkTheme.tr(),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 100,
                    child: NormalButton(
                      onTap: () => value.doAction(0),
                      text: LocaleKeys.change.tr(),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: context.largeSpacerOnlyHorizontal,
              child: Row(
                children: [
                  LabelText(
                    text: LocaleKeys.language.tr(),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 100,
                    child: NormalButton(
                      onTap: () => value.doAction(1),
                      text: LocaleKeys.change.tr(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
