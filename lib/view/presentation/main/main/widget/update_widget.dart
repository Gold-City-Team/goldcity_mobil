import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/language/locale_keys.g.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/widget/text/label_text.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateWidget extends StatelessWidget {
  const UpdateWidget({super.key});

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
                LabelText(text: LocaleKeys.updateRequired.tr()),
                Gap(context.largeSpacerSize),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      if (Platform.isAndroid || Platform.isIOS) {
                        final appId = Platform.isAndroid
                            ? 'com.goldcity.goldcitycondominium'
                            : '6651836205';
                        final url = Uri.parse(
                          Platform.isAndroid
                              ? "market://details?id=$appId"
                              : "https://apps.apple.com/app/id$appId",
                        );
                        launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                        );
                      }
                    },
                    child: Container(
                      color:
                          context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
                      width: isTablet() ? size.width / 2 : size.width - 30,
                      padding: context.midSpacer,
                      child: LabelText(
                          text: LocaleKeys.update.tr(),
                          align: TextAlign.center),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
