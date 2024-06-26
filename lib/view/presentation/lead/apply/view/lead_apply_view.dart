import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/config/language/locale_keys.g.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/view/presentation/lead/apply/view_model/lead_apply_view_model.dart';
import 'package:goldcity/view/widget/app_bar/normal_app_bar.dart';
import 'package:goldcity/view/widget/button/normal_button.dart';
import 'package:goldcity/view/widget/text/label_text.dart';
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
          onPressed: () => context.setLocale(const Locale("tr", "TR")),
        ),
        body: SafeArea(
          child: Padding(
            padding: context.midSpacerOnlyHorizontal,
            child: Stack(
              children: [
                NormalAppBar(
                  backPressed: () => value.navigation.pop(),
                  title: LocaleKeys.applicationFormTitle.tr(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LabelText(text: LocaleKeys.nameSurnameQuestion.tr()),
                    Gap(context.midSpacerSize),
                    RoundedTextField(
                        key: const Key("fullName"),
                        newText: (newText) => value.fullName = newText),
                    Gap(context.midSpacerSize),
                    LabelText(text: LocaleKeys.telephoneQuestion.tr()),
                    Gap(context.midSpacerSize),
                    RoundedTextField(
                        key: const Key("telephone"),
                        newText: (newText) => value.telephone = newText),
                    Gap(context.midSpacerSize),
                    LabelText(text: LocaleKeys.mailQuestion.tr()),
                    Gap(context.midSpacerSize),
                    RoundedTextField(
                        key: const Key("mailAdress"),
                        newText: (newText) => value.mailAdress = newText),
                    Gap(context.largeSpacerSize),
                    SizedBox(
                      height: 50,
                      child: NormalButton(
                        onTap: () => value.apply(),
                        text: LocaleKeys.send.tr(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
