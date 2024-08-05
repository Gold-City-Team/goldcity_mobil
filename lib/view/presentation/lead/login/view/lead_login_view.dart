import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/base/view/base_view.dart';
import 'package:goldcity/config/language/locale_keys.g.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/enum/input_type.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
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
          child: Stack(
            children: [
              isTablet()
                  ? tabletView(context, value)
                  : phoneView(context, value),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => context.pop(),
                  child: Container(
                    width: 50,
                    margin: context.largeSpacer,
                    height: 50,
                    decoration: BoxDecoration(
                        color: context.toColor(APPLICATION_COLOR.GOLD),
                        borderRadius: context.midRadius),
                    child: const Icon(Icons.keyboard_arrow_left),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget phoneView(BuildContext context, LeadLoginViewModel value) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: SizedBox(
            height: context.sHeight,
            child: NormalNetworkImage(
                fit: BoxFit.cover,
                source:
                    "https://goldcitycondominium.com/_next/image?url=%2Fimages%2Fprojects%2FleJardin%2Flejardin.webp&w=1080&q=75"),
          ),
        ),
        Expanded(
            flex: 6,
            child: Container(
              padding: context.xlargeSpacerOnlyHorizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: context.midSpacerOnlyBottom,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1.5,
                                  color: context
                                      .toColor(APPLICATION_COLOR.GOLD)))),
                      child: LabelText(
                        text: "Giriş Yap",
                        fontSize: FONT_SIZE.HEADLINE_LARGE,
                        fontWeight: FontWeight.bold,
                      )),
                  Gap(context.midSpacerSize),
                  LabelText(
                    text:
                        "Hesap bilgilerinizi girerek partner hesabınıza giriş yapabilirsiniz.",
                    fontSize: FONT_SIZE.LABEL_LARGE,
                    fontWeight: FontWeight.w400,
                  ),
                  Gap(context.largeSpacerSize),
                  LabelText(
                    text: LocaleKeys.mailQuestion.tr(),
                    fontWeight: FontWeight.w400,
                    textColor: APPLICATION_COLOR.GOLD,
                  ),
                  SizedBox(
                    height: 40,
                    child: RoundedTextField(
                        key: const Key("mailAdress"),
                        newText: (newText) => value.mailAdress = newText),
                  ),
                  Gap(context.largeSpacerSize),
                  LabelText(
                    text: LocaleKeys.passwordQuestion.tr(),
                    fontWeight: FontWeight.w400,
                    textColor: APPLICATION_COLOR.GOLD,
                  ),
                  SizedBox(
                    height: 40,
                    child: RoundedTextField(
                        key: const Key("password"),
                        inputType: InputType.PASSWORD,
                        newText: (newText) => value.password = newText),
                  ),
                  Gap(context.largeSpacerSize),
                  SizedBox(
                    height: 40,
                    child: NormalButton(
                      backgroundColor: APPLICATION_COLOR.GOLD,
                      onTap: () => value.login(),
                      textColor: APPLICATION_COLOR.LIGHT,
                      text: LocaleKeys.send.tr(),
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }

  Widget tabletView(BuildContext context, LeadLoginViewModel value) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: SizedBox(
            height: context.sHeight,
            child: NormalNetworkImage(
                fit: BoxFit.cover,
                source:
                    "https://goldcitycondominium.com/_next/image?url=%2Fimages%2Fprojects%2FleJardin%2Flejardin.webp&w=1080&q=75"),
          ),
        ),
        Expanded(
            flex: 4,
            child: Container(
              padding: context.xlargeSpacerOnlyHorizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: context.midSpacerOnlyBottom,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1.5,
                                  color: context
                                      .toColor(APPLICATION_COLOR.GOLD)))),
                      child: LabelText(
                        text: "Giriş Yap",
                        fontSize: FONT_SIZE.HEADLINE_LARGE,
                        fontWeight: FontWeight.bold,
                      )),
                  Gap(context.midSpacerSize),
                  LabelText(
                    text:
                        "Hesap bilgilerinizi girerek partner hesabınıza giriş yapabilirsiniz.",
                    fontSize: FONT_SIZE.LABEL_LARGE,
                    fontWeight: FontWeight.w400,
                  ),
                  Gap(context.largeSpacerSize),
                  LabelText(
                    text: LocaleKeys.mailQuestion.tr(),
                    fontWeight: FontWeight.w400,
                    textColor: APPLICATION_COLOR.GOLD,
                  ),
                  SizedBox(
                    height: 40,
                    child: RoundedTextField(
                        key: const Key("mailAdress"),
                        newText: (newText) => value.mailAdress = newText),
                  ),
                  Gap(context.largeSpacerSize),
                  LabelText(
                    text: LocaleKeys.passwordQuestion.tr(),
                    fontWeight: FontWeight.w400,
                    textColor: APPLICATION_COLOR.GOLD,
                  ),
                  SizedBox(
                    height: 40,
                    child: RoundedTextField(
                        key: const Key("password"),
                        inputType: InputType.PASSWORD,
                        newText: (newText) => value.password = newText),
                  ),
                  Gap(context.largeSpacerSize),
                  SizedBox(
                    height: 40,
                    child: NormalButton(
                      backgroundColor: APPLICATION_COLOR.GOLD,
                      onTap: () => value.login(),
                      textColor: APPLICATION_COLOR.LIGHT,
                      text: LocaleKeys.send.tr(),
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
