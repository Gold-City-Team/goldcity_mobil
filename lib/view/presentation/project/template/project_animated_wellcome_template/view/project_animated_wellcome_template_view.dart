import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:goldcity/util/constant/general_enum.dart';
import 'package:goldcity/util/extension/design_extension.dart';
import 'package:goldcity/util/extension/theme_extension.dart';
import 'package:goldcity/view/widget/image/normal_network_image.dart';

class ProjectAnimatedWelcomeTemplateView extends StatelessWidget {
  final String url;
  const ProjectAnimatedWelcomeTemplateView({required this.url, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.sWidth,
      height: context.sHeight,
      child: Stack(
        children: [
          SizedBox(
            width: context.sWidth,
            height: context.sHeight,
            child: NormalNetworkImage(
              source: url,
            ),
          ),
          Container(
            color: context.toColor(APPLICATION_COLOR.BACKGROUND_COLOR),
            width: context.sWidth,
            height: context.sHeight,
          ).animate(delay: const Duration(milliseconds: 100)).slideX(
              begin: 0.2,
              end: 1,
              duration: const Duration(milliseconds: 1500),
              curve: Curves.easeOutCubic),
        ],
      ),
    );
  }
}
