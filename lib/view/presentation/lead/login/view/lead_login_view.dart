import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/config/language/locale_keys.g.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/presentation/lead/login/view_model/lead_login_view_model.dart';
import 'package:goldcity/view/widget/button/normal_button.dart';
import 'package:goldcity/view/widget/text/label_text.dart';
import 'package:goldcity/view/widget/text_field/rounded_text_field.dart';

class LeadLoginView extends StatelessWidget {
  const LeadLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<LeadLoginViewModel>(
      viewModel: LeadLoginViewModel(),
      onModelReady: (model) {
        model.init();
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, LeadLoginViewModel value) =>
          Scaffold(
        body: SafeArea(
          child: Padding(
            padding: context.midSpacerOnlyHorizontal,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () => context.pop(),
                  child: Container(
                    width: 50,
                    margin: context.midSpacerOnlyTop,
                    height: 50,
                    decoration: BoxDecoration(
                        color: context.toColor(APPLICATION_COLOR.GOLD),
                        borderRadius: context.midRadius),
                    child: const Icon(Icons.keyboard_arrow_left),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: isTablet() ? context.sWidth / 2 : context.sWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LabelText(text: LocaleKeys.mailQuestion.tr()),
                        Gap(context.midSpacerSize),
                        SizedBox(
                          height: 45,
                          child: RoundedTextField(
                              key: const Key("mailAdress"),
                              newText: (newText) => value.mailAdress = newText),
                        ),
                        Gap(context.largeSpacerSize),
                        LabelText(text: LocaleKeys.passwordQuestion.tr()),
                        Gap(context.midSpacerSize),
                        SizedBox(
                          height: 45,
                          child: RoundedTextField(
                              key: const Key("password"),
                              newText: (newText) => value.password = newText),
                        ),
                        Gap(context.largeSpacerSize),
                        SizedBox(
                          height: 45,
                          child: NormalButton(
                            backgroundColor: APPLICATION_COLOR.GOLD,
                            onTap: () => value.login(),
                            textColor: APPLICATION_COLOR.LIGHT,
                            text: LocaleKeys.login.tr(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
