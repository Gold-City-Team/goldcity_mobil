import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/config/language/locale_keys.g.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/presentation/lead/login/view_model/lead_login_view_model.dart';
import 'package:goldcity/view/widget/button/normal_button.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LabelText(text: LocaleKeys.mailQuestion.tr()),
                    Gap(context.midSpacerSize),
                    RoundedTextField(
                        key: const Key("mailAdress"),
                        newText: (newText) => value.mailAdress = newText),
                    Gap(context.largeSpacerSize),
                    LabelText(text: LocaleKeys.passwordQuestion.tr()),
                    Gap(context.midSpacerSize),
                    RoundedTextField(
                        key: const Key("password"),
                        newText: (newText) => value.password = newText),
                    Gap(context.largeSpacerSize),
                    SizedBox(
                      height: 50,
                      child: NormalButton(
                        onTap: () => value.login(),
                        text: LocaleKeys.login.tr(),
                      ),
                    ),
                    Gap(context.largeSpacerSize),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => value.handleSignIn(),
                            child: Container(
                              height: 60,
                              color: context
                                  .toColor(APPLICATION_COLOR.OPPOSITE_COLOR),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: NormalNetworkImage(
                                        fit: BoxFit.contain,
                                        source:
                                            "https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png"),
                                  ),
                                  LabelText(
                                    text: "Google ile Giriş Yap",
                                    textColor:
                                        APPLICATION_COLOR.BACKGROUND_COLOR,
                                  ),
                                  Gap(context.midSpacerSize)
                                ],
                              ),
                            ),
                          ),
                        ),
                        Gap(context.largeSpacerSize),
                        Expanded(
                          child: Container(
                            height: 60,
                            color: context
                                .toColor(APPLICATION_COLOR.OPPOSITE_COLOR),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: NormalNetworkImage(
                                      fit: BoxFit.contain,
                                      source:
                                          "https://www.freepnglogos.com/uploads/apple-logo-png/apple-logo-png-index-content-uploads-10.png"),
                                ),
                                LabelText(
                                  text: "Apple ile Giriş Yap",
                                  textColor: APPLICATION_COLOR.BACKGROUND_COLOR,
                                ),
                                Gap(context.midSpacerSize)
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
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
