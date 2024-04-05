import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/view/widget/text/label_text.dart';

class NormalAppBar extends StatelessWidget {
  final String title;
  final VoidCallback backPressed;
  const NormalAppBar({this.title = "", required this.backPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: backPressed,
              child: Padding(
                padding: context.largeSpacerOnlyRight,
                child: const Icon(
                  Icons.arrow_back_ios_new_sharp,
                  size: 28,
                ),
              )),
          Gap(context.midSpacerSize),
          title.isNotEmpty
              ? LabelText(
                  text: title,
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
