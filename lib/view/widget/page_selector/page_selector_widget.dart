import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/widget/text/label_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'package:goldcity/domain/entity/contact/contact_entity.dart';

class PageSelectorWidget extends StatelessWidget {
  final List<String> pages;
  final int selectedIndex;
  final Function(int) newIndex;
  final bool showPop;
  final ContactEntity? contactEntity;

  const PageSelectorWidget({
    required this.pages,
    required this.selectedIndex,
    required this.newIndex,
    this.showPop = true,
    this.contactEntity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WebViewAware(
      child: Row(
        children: [
          Expanded(
              child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => newIndex(selectedIndex),
              child: Container(
                color: Colors.red.withOpacity(0),
              ),
            ),
          )),
          Container(
            color: context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
            width: context.sWidth / (isTablet() ? 3 : 1),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  showPop
                      ? MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => newIndex(selectedIndex),
                            child: Container(
                              width: 50,
                              margin: context.largeSpacer,
                              height: 50,
                              decoration: BoxDecoration(
                                  color:
                                      context.toColor(APPLICATION_COLOR.GOLD),
                                  borderRadius: context.midRadius),
                              child: const Icon(Icons.close),
                            ),
                          ),
                        )
                      : Container(
                          margin: context.largeSpacer,
                          width: 50,
                          height: 50,
                        ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: pages.length,
                      itemBuilder: (context, index) {
                        if (pages[index].isEmpty) {
                          return const SizedBox.shrink();
                        }
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => newIndex(index),
                            child: Container(
                                decoration: BoxDecoration(
                                  border: selectedIndex == index
                                      ? Border(
                                          left: BorderSide(
                                              width: 3,
                                              color: context.toColor(
                                                  APPLICATION_COLOR.GOLD)),
                                        )
                                      : null,
                                ),
                                width: context.sWidth,
                                padding: EdgeInsets.only(left: 40),
                                alignment: Alignment.centerLeft,
                                height: 35,
                                margin: context.midSpacerOnlyBottom,
                                child: LabelText(
                                  textLineHeight: 1,
                                  align: TextAlign.center,
                                  text: "• ${pages[index]}",
                                  textColor: selectedIndex == index
                                      ? APPLICATION_COLOR.GOLD
                                      : APPLICATION_COLOR.SUBTITLE,
                                  fontSize: selectedIndex == index
                                      ? FONT_SIZE.HEADLINE_LARGE
                                      : FONT_SIZE.HEADLINE_SMALL,
                                )),
                          ),
                        );
                      }),
                  Gap(context.largeSpacerSize),
                  Spacer(),
                  contactEntity != null
                      ? Container(
                          height: 35,
                          padding: EdgeInsets.only(left: 40, right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    launchUrl(Uri.parse(
                                        "tel:${contactEntity!.phoneNumber}"));
                                  },
                                  child: SizedBox(
                                    width: 35,
                                    height: 35,
                                    child: kIsWeb
                                        ? Image.network(
                                            contactEntity!.phoneNumberImage.url,
                                            color: context.toColor(
                                                APPLICATION_COLOR.SUBTITLE),
                                          )
                                        : SvgPicture.network(
                                            fit: BoxFit.contain,
                                            color: context.toColor(
                                                APPLICATION_COLOR.SUBTITLE),
                                            contactEntity!
                                                .phoneNumberImage.url),
                                  ),
                                ),
                              ),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () async {
                                    var androidUrl =
                                        "whatsapp://send?phone=${contactEntity!.whatsapp}";
                                    var iosUrl =
                                        "https://wa.me/${contactEntity!.whatsapp}";
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
                                  child: SizedBox(
                                    width: 35,
                                    height: 35,
                                    child: kIsWeb
                                        ? Image.network(
                                            contactEntity!.whatsappImage.url,
                                            color: context.toColor(
                                                APPLICATION_COLOR.SUBTITLE),
                                          )
                                        : SvgPicture.network(
                                            fit: BoxFit.contain,
                                            color: context.toColor(
                                                APPLICATION_COLOR.SUBTITLE),
                                            contactEntity!.whatsappImage.url),
                                  ),
                                ),
                              ),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    launchUrl(Uri.parse(
                                        "mailto:${contactEntity!.email}"));
                                  },
                                  child: SizedBox(
                                    width: 35,
                                    height: 35,
                                    child: kIsWeb
                                        ? Image.network(
                                            contactEntity!.emailImage.url,
                                            color: context.toColor(
                                                APPLICATION_COLOR.SUBTITLE),
                                          )
                                        : SvgPicture.network(
                                            contactEntity!.emailImage.url,
                                            fit: BoxFit.contain,
                                            color: context.toColor(
                                                APPLICATION_COLOR.SUBTITLE),
                                          ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
                  Gap(context.largeSpacerSize),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
