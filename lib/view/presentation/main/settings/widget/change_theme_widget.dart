import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/notifier/theme_notifier.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/widget/text/label_text.dart';
import 'package:provider/provider.dart';

class ChangeThemeWidget extends StatelessWidget {
  const ChangeThemeWidget({super.key});

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
                LabelText(text: context.tr("changeTheme")),
                Gap(context.largeSpacerSize),
                GestureDetector(
                  onTap: () => context.read<ThemeNotifier>().setDarkTheme(),
                  child: Container(
                    color: context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
                    width: isTablet() ? size.width / 2 : size.width - 30,
                    padding: context.midSpacer,
                    child: Row(
                      children: [
                        context.watch<ThemeNotifier>().appTheme ==
                                APP_THEME.DARK
                            ? const Icon(Icons.check)
                            : const SizedBox.shrink(),
                        context.watch<ThemeNotifier>().appTheme ==
                                APP_THEME.DARK
                            ? Gap(context.midSpacerSize)
                            : const SizedBox.shrink(),
                        LabelText(text: context.tr("darkTheme")),
                      ],
                    ),
                  ),
                ),
                Gap(context.midSpacerSize),
                GestureDetector(
                  onTap: () => context.read<ThemeNotifier>().setLightTheme(),
                  child: Container(
                    color: context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
                    width: isTablet() ? size.width / 2 : size.width - 30,
                    padding: context.midSpacer,
                    child: Row(
                      children: [
                        context.watch<ThemeNotifier>().appTheme ==
                                APP_THEME.LIGHT
                            ? const Icon(Icons.check)
                            : const SizedBox.shrink(),
                        context.watch<ThemeNotifier>().appTheme ==
                                APP_THEME.LIGHT
                            ? Gap(context.midSpacerSize)
                            : const SizedBox.shrink(),
                        LabelText(text: context.tr("lightTheme")),
                      ],
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
