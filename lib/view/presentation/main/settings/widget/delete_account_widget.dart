import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/data/shared_manager.dart';
import 'package:goldcity/config/language/locale_keys.g.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:goldcity/util/enum/preference_key_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/util/resources/authentication_source.dart';
import 'package:goldcity/view/widget/text/label_text.dart';
import 'package:goldcity/domain/usecase/lead_usecase.dart';

class DeleteAccountWidget extends StatelessWidget {
  final LeadUseCase lead;
  const DeleteAccountWidget({required this.lead, super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: isTablet() ? size.width / 2 : size.width - 30,
            color:
                context.toColor(APPLICATION_COLOR.EXTRA_CLOSE_BACKGROUND_COLOR),
            padding: context.largeSpacer,
            child: Column(
              children: [
                LabelText(text: LocaleKeys.deleteAccount.tr()),
                Gap(context.largeSpacerSize),
                LabelText(
                    text: LocaleKeys.areYouSure.tr(),
                    textColor: APPLICATION_COLOR.SUBTITLE),
                Gap(context.largeSpacerSize),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () async {
                      await lead.deleteAccount();
                      locator<AuthenticationSource>().clearUserDto();
                      locator<SharedManager>()
                          .removeKey(PreferenceKey.USER_DTO);
                      context.pushReplacement(NavigationConstant.MAIN);
                    },
                    child: Container(
                      color:
                          context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
                      width: isTablet() ? size.width / 2 : size.width - 30,
                      padding: context.midSpacer,
                      child: LabelText(
                          text: LocaleKeys.deleteAccount.tr(),
                          align: TextAlign.center),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
