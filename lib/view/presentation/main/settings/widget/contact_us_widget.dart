import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/config/language/locale_keys.g.dart';
import 'package:goldcity/domain/entity/contact/contact_entity.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/widget/text/label_text.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsWidget extends StatelessWidget {
  final ContactEntity contactEntity;
  const ContactUsWidget({required this.contactEntity, super.key});

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
                LabelText(text: LocaleKeys.contactUs.tr()),
                Gap(context.largeSpacerSize),
                Column(children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () async {
                        var contact = contactEntity.phoneNumber;
                        var androidUrl = "whatsapp://send?phone=$contact";
                        var iosUrl = "https://wa.me/$contact";
                        if (!kIsWeb) {
                          if (Platform.isIOS) {
                            await launchUrl(Uri.parse(iosUrl));
                          } else {
                            await launchUrl(Uri.parse(androidUrl));
                          }
                        } else {
                          await launchUrl(Uri.parse(androidUrl));
                        }
                      },
                      child: Container(
                          color: context
                              .toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
                          width: isTablet() ? size.width / 2 : size.width - 30,
                          padding: context.midSpacer,
                          child: LabelText(text: "Whatsapp")),
                    ),
                  ),
                ]),
                Gap(context.midSpacerSize),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => launchUrl(
                        Uri.parse("tel:${contactEntity.phoneNumber}")),
                    child: Container(
                        color:
                            context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
                        width: isTablet() ? size.width / 2 : size.width - 30,
                        padding: context.midSpacer,
                        child: LabelText(text: context.tr("telephone"))),
                  ),
                ),
                Gap(context.midSpacerSize),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () =>
                        launchUrl(Uri.parse("mailto:${contactEntity.email}")),
                    child: Container(
                        color:
                            context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
                        width: isTablet() ? size.width / 2 : size.width - 30,
                        padding: context.midSpacer,
                        child: LabelText(text: context.tr("mail"))),
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
