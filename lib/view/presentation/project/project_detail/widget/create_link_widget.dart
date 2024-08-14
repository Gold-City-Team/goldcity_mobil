import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/widget/snackbar/error_snackbar.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class CreateLinkWidget extends StatelessWidget {
  final String link;
  const CreateLinkWidget({required this.link, super.key});

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
                LabelText(text: context.tr("shareProject")),
                Gap(context.largeSpacerSize),
                Row(
                  children: [
                    Material(
                      child: Container(
                        height: 50,
                        width: isTablet()
                            ? (context.sWidth / 2) - 90
                            : context.sWidth - 120,
                        alignment: Alignment.center,
                        padding: context.largeSpacerOnlyHorizontal,
                        color:
                            context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
                        child: SelectableText(
                          enableInteractiveSelection: true,
                          link,
                          maxLines: 1,
                          selectionControls: MaterialTextSelectionControls(),
                        ),
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => {
                          Clipboard.setData(ClipboardData(text: link))
                              .then((_) {
                            AnimatedSnackBar(
                                    desktopSnackBarPosition:
                                        DesktopSnackBarPosition.topCenter,
                                    snackBarStrategy: RemoveSnackBarStrategy(),
                                    builder: (context) => ErrorSnackBar(
                                        message: context.tr("linkCopied")))
                                .show(context);
                          })
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: context.toColor(APPLICATION_COLOR.GOLD),
                          ),
                          child: const Icon(Icons.ios_share),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
