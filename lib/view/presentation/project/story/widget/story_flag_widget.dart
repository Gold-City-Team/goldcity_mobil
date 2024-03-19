import 'package:flutter/material.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';

class StoryFlagWidget extends StatelessWidget {
  final bool isSelected;
  const StoryFlagWidget(this.isSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3,
      decoration: BoxDecoration(
        borderRadius: context.midRadius,
        color: isSelected
            ? context.toColor(APPLICATION_COLOR.GOLD)
            : context.toColor(APPLICATION_COLOR.GOLD).withAlpha(120),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 5),
    );
  }
}
