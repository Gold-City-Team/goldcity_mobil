import 'package:flutter/material.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/widget/text/label_text.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PageSelectorWidget extends StatelessWidget {
  final List<String> pages;
  final int selectedIndex;
  final Function(int) newIndex;
  final bool showPop;

  const PageSelectorWidget({
    required this.pages,
    required this.selectedIndex,
    required this.newIndex,
    this.showPop = true,
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
                  Expanded(
                    child: ListView.builder(
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
                                  height: 50,
                                  margin: context.midSpacerOnlyBottom,
                                  child: LabelText(
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
