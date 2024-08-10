import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/language/locale_keys.g.dart';
import 'package:goldcity/data/dto/send/lead/change_password_dto.dart';
import 'package:goldcity/domain/usecase/lead_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/widget/button/normal_button.dart';
import 'package:goldcity/view/widget/snackbar/error_snackbar.dart';
import 'package:goldcity/view/widget/text/label_text.dart';
import 'package:goldcity/view/widget/text_field/rounded_text_field.dart';

class ChangePasswordWidget extends StatelessWidget {
  ChangePasswordWidget({super.key});
  String oldPassword = "";
  String password = "";
  String passwordAgain = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      width: size.width,
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: isTablet() ? size.width / 2 : size.width - 30,
              color: context
                  .toColor(APPLICATION_COLOR.EXTRA_CLOSE_BACKGROUND_COLOR),
              padding: context.largeSpacer,
              child: Column(
                children: [
                  LabelText(text: LocaleKeys.passChange.tr()),
                  Gap(context.largeSpacerSize),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(context.midSpacerSize),
                      LabelText(
                        text: LocaleKeys.oldPassword.tr(),
                        fontWeight: FontWeight.w400,
                        textColor: APPLICATION_COLOR.GOLD,
                      ),
                      Gap(context.midSpacerSize),
                      SizedBox(
                        height: 40,
                        child: RoundedTextField(
                            key: const Key("oldPassword"),
                            newText: (newText) => oldPassword = newText),
                      ),
                      Gap(context.midSpacerSize),
                      LabelText(
                        text: LocaleKeys.newPassword.tr(),
                        fontWeight: FontWeight.w400,
                        textColor: APPLICATION_COLOR.GOLD,
                      ),
                      Gap(context.midSpacerSize),
                      SizedBox(
                        height: 40,
                        child: RoundedTextField(
                            key: const Key("newPassword"),
                            newText: (newText) => password = newText),
                      ),
                      Gap(context.midSpacerSize),
                      LabelText(
                        text: LocaleKeys.newPasswordAgain.tr(),
                        fontWeight: FontWeight.w400,
                        textColor: APPLICATION_COLOR.GOLD,
                      ),
                      Gap(context.midSpacerSize),
                      SizedBox(
                        height: 40,
                        child: RoundedTextField(
                            key: const Key("newPasswordAgain"),
                            newText: (newText) => passwordAgain = newText),
                      ),
                      Gap(context.midSpacerSize),
                      SizedBox(
                        height: 40,
                        child: NormalButton(
                          onTap: () async {
                            if (password == passwordAgain) {
                              var result = await locator<LeadUseCase>()
                                  .leadChangePassword(ChangePasswordDto(
                                      password: oldPassword,
                                      newPassword: password));

                              if (result != null) {
                                AnimatedSnackBar(
                                    desktopSnackBarPosition:
                                        DesktopSnackBarPosition.topCenter,
                                    snackBarStrategy: RemoveSnackBarStrategy(),
                                    builder: (context) => ErrorSnackBar(
                                        message:
                                            "${result.detail}")).show(context);
                              } else {
                                context.pop();
                              }
                            } else {
                              AnimatedSnackBar(
                                  desktopSnackBarPosition:
                                      DesktopSnackBarPosition.topCenter,
                                  snackBarStrategy: RemoveSnackBarStrategy(),
                                  builder: (context) => ErrorSnackBar(
                                      message:
                                          LocaleKeys.doNotMatch)).show(context);
                            }
                          },
                          text: LocaleKeys.send.tr(),
                          textColor: APPLICATION_COLOR.LIGHT,
                          backgroundColor: APPLICATION_COLOR.GOLD,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
