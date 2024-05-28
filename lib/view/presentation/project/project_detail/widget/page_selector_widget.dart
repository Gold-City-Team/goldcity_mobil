import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class PageSelectorWidget extends StatelessWidget {
  final List<String> pages;
  final int selectedIndex;
  final Function(int) newIndex;

  const PageSelectorWidget({
    required this.pages,
    required this.selectedIndex,
    required this.newIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () => newIndex(selectedIndex),
              child: Container(
                width: 50,
                margin: context.largeSpacer,
                height: 50,
                decoration: BoxDecoration(
                    color: context.toColor(APPLICATION_COLOR.GOLD),
                    borderRadius: context.midRadius),
                child: const Icon(Icons.close),
              ),
            ),
            const Spacer(),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: pages.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => newIndex(index),
                      child: Container(
                          width: context.sWidth,
                          alignment: Alignment.center,
                          height: 50,
                          margin: context.midSpacerOnlyBottom,
                          child: LabelText(
                            text: pages[index],
                            textColor: selectedIndex == index
                                ? APPLICATION_COLOR.TITLE
                                : APPLICATION_COLOR.SUBTITLE,
                            fontSize: selectedIndex == index
                                ? FONT_SIZE.HEADLINE_LARGE
                                : FONT_SIZE.HEADLINE_MEDIUM,
                          )),
                    );
                  }),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
