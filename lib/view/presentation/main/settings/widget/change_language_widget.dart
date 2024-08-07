import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/language/locale_keys.g.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class ChangeLanguageWidget extends StatelessWidget {
  const ChangeLanguageWidget({super.key});

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
                LabelText(text: LocaleKeys.changeLanguage.tr()),
                Gap(context.largeSpacerSize),
                Column(
                  children: context.supportedLocales
                      .map(
                        (element) => Column(
                          children: [
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () => context.setLocale(element),
                                child: Container(
                                  color: context.toColor(
                                      APPLICATION_COLOR.BACKGROUND_COLOR),
                                  width: isTablet()
                                      ? size.width / 2
                                      : size.width - 30,
                                  padding: context.midSpacer,
                                  child: Row(
                                    children: [
                                      context.locale == element
                                          ? const Icon(Icons.check)
                                          : const SizedBox.shrink(),
                                      context.locale == element
                                          ? Gap(context.midSpacerSize)
                                          : const SizedBox.shrink(),
                                      LabelText(
                                          text: element
                                              .toLanguageTag()
                                              .localeToNativeLanguage),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Gap(context.midSpacerSize),
                          ],
                        ),
                      )
                      .toList(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
